import shlex
import hashlib
import requests
from io import BytesIO
from docker.errors import ImageNotFound

from ..constants import RUNNER_CHECKOUTER_TAG, RUNNER_TAG_PREFIX, RUNNER_CLEANUP_TAG
from ..schemas.stage import StageIn, StageOut, StageStatus
from ..crud.repo_settings import get_settings
from ..crud.stage import add_stage
from ..schemas import config
from ..models.run import Run
from ..database import SessionLocal
from .docker_client import docker_client
from .parser import parse_config

def build_stage(name: str, stage: config.Stage):
    dockerfile = f'''
    FROM {stage.image}
    
    RUN touch .steps.sh
    '''

    for step in stage.steps:
        dockerfile += f'RUN echo {shlex.quote(step)} >> .steps.sh\n'

    dockerfile += f'''
    RUN mkdir sources
    WORKDIR sources
    ENTRYPOINT ["/bin/sh", "/.steps.sh"]
    '''

    tag = f'{RUNNER_TAG_PREFIX}-{name}-{hashlib.md5(dockerfile.encode("utf-8")).hexdigest()}'

    try:
        docker_client.images.get(tag)
    except ImageNotFound as e:
        dockerfile = BytesIO(dockerfile.encode('utf-8'))
        docker_client.images.build(fileobj=dockerfile, tag=tag, rm=True, forcerm=True)

    return tag

def add_stage_(stage: StageIn) -> StageOut:
    with SessionLocal() as db:
        db.expire_on_commit = False
        return add_stage(db, stage)

def build_worker(run: Run, build_finished):
    config_raw = requests.get(run.config_url, headers={ 'Authorization': f'Bearer {run.token}' }).text
    config = parse_config(config_raw)

    env_vars = {
        'GH_TOKEN': run.token,
        'BRANCH_NAME': run.branch_name,
    }

    with SessionLocal() as db:
        settings = get_settings(db, for_repo=run.repo_id)
        env_vars = settings.env_vars

    stage_order = len(config.stages.keys())
    cleanup_stage = add_stage_(StageIn(
        run_id=run.id,
        user_id=run.user_id,
        order=stage_order + 1,
        next_stage=-1,
        name='cleanup',
        image_tag=RUNNER_CLEANUP_TAG,
        env_vars=env_vars
    ))
    next_stage = cleanup_stage.id

    for stage_name, stage in list(config.stages.items())[::-1]:
        stage_tag = build_stage(stage_name, stage, config.image)

        stage = add_stage_(StageIn(
            run_id=run.id,
            user_id=run.user_id,
            order=stage_order,
            next_stage=next_stage,
            name=stage_name,
            image_tag=stage_tag,
            env_vars=env_vars,
            artifacts=stage.artifacts
        ))
        next_stage = stage.id
        stage_order -= 1

    add_stage_(StageIn(
        run_id=run.id,
        user_id=run.user_id,
        order=0,
        next_stage=next_stage,
        status=StageStatus.Ready,
        name='checkout',
        image_tag=RUNNER_CHECKOUTER_TAG,
        env_vars={
            'REPO_URL': run.clone_url,
            'COMMIT_ID': run.commit_id,
            **env_vars
        },
    ))
    
    build_finished()
