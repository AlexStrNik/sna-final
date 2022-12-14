import os
from os import path

from ..database import SessionLocal
from ..constants import RUNNER_CHECKOUTER_TAG, RUNNER_CLEANUP_TAG, RUNNER_TMP_DIR, RUNNER_LOGS_DIR
from ..schemas.stage import StageInternal, StageStatus
from ..crud.stage import set_stage_status
from .docker_client import docker_client

def run_worker(stage: StageInternal, run_finished):
    run_dir = path.join(os.getcwd(), RUNNER_TMP_DIR, str(stage.run_id))
    log_path = path.join(os.getcwd(), RUNNER_LOGS_DIR, str(stage.run_id))

    if stage.image_tag == RUNNER_CLEANUP_TAG:
        # todo
        return

    if stage.image_tag == RUNNER_CHECKOUTER_TAG:
        os.makedirs(log_path)
        os.makedirs(run_dir)

    container = docker_client.containers.run(
        stage.image_tag,
        detach=True,
        volumes={ run_dir: { 'bind': '/sources', 'mode': 'rw' } },
        environment=stage.env_vars
    )

    with open(path.join(log_path, f'{stage.name}.log'), 'wb') as log:
        for log_line in container.logs(stream=True, stdout=True, stderr=True):
            log.write(log_line)
            log.flush()

    status = container.wait()
    container.remove()

    with SessionLocal() as db:
        if status['StatusCode'] == 0:
            set_stage_status(db, status=StageStatus.Success, for_stage_id=stage.id)
            set_stage_status(db, status=StageStatus.Ready, for_stage_id=stage.next_stage)
        else:
            set_stage_status(db, status=StageStatus.Failed, for_stage_id=stage.id)

    run_finished()
