import os
import errno
import shutil
from os import path

from ..database import SessionLocal
from ..constants import RUNNER_CHECKOUTER_TAG, RUNNER_CLEANUP_TAG, RUNNER_TMP_DIR, RUNNER_LOGS_DIR, RUNNER_ARTIFACTS_DIR
from ..schemas.stage import StageInternal, StageStatus
from ..crud.stage import set_stage_status
from .docker_client import docker_client

def run_worker(stage: StageInternal, run_finished):
    run_dir = path.join(os.getcwd(), RUNNER_TMP_DIR, str(stage.run_id))
    artifacts_dir = path.join(os.getcwd(), RUNNER_ARTIFACTS_DIR, str(stage.run_id))
    logs_dir = path.join(os.getcwd(), RUNNER_LOGS_DIR, str(stage.run_id))

    if stage.image_tag == RUNNER_CLEANUP_TAG:
        shutil.rmtree(run_dir)
        return

    if stage.image_tag == RUNNER_CHECKOUTER_TAG:
        os.makedirs(run_dir)
        os.makedirs(logs_dir)
        os.makedirs(artifacts_dir)

    container = docker_client.containers.run(
        stage.image_tag,
        detach=True,
        volumes={ run_dir: { 'bind': '/sources', 'mode': 'rw' } },
        environment=stage.env_vars
    )

    with open(path.join(logs_dir, f'{stage.name}.log'), 'wb') as log:
        for log_line in container.logs(stream=True, stdout=True, stderr=True):
            log.write(log_line)
            log.flush()

    status = container.wait()
    container.remove()

    with SessionLocal() as db:
        if status['StatusCode'] == 0:
            if stage.artifacts:
                for artifact_path in stage.artifacts:
                    try:
                        shutil.copytree(path.join(run_dir, artifact_path), path.join(artifacts_dir, artifact_path))
                    except OSError as exc:
                        if exc.errno in (errno.ENOTDIR, errno.EINVAL):
                            shutil.copy(path.join(run_dir, artifact_path), path.join(artifacts_dir, artifact_path))
                        else: raise

            set_stage_status(db, status=StageStatus.Success, for_stage_id=stage.id)
            set_stage_status(db, status=StageStatus.Ready, for_stage_id=stage.next_stage)
        else:
            set_stage_status(db, status=StageStatus.Failed, for_stage_id=stage.id)

    run_finished()
