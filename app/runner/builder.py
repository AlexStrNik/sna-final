import shlex
import hashlib
import requests
from io import BytesIO
from docker.errors import ImageNotFound

from ..constants import RUNNER_CHECKOUTER_TAG, RUNNER_TAG_PREFIX, RUNNER_CLEANUP_TAG
from ..schemas.stage import StageIn, StageOut
from ..crud.stage import add_stage
from ..schemas import config
from ..models.run import Run
from ..database import SessionLocal
from .docker_client import docker_client
from .utils import parse_config

def build_stage(name: str, stage: config.Stage, config_image: str):
    image = stage.image
    if not image:
        image = config_image

    dockerfile = f'''
    FROM {image}
    
    RUN touch .steps.sh
    '''

    for step in stage.steps:
        dockerfile += f'RUN echo {shlex.quote(step)} >> .steps.sh\n'

    dockerfile += f'''
    RUN mkdir sources
    WORKDIR sources
    ENTRYPOINT ["/bin/bash", "/.steps.sh"]
    '''

    tag = f'{RUNNER_TAG_PREFIX}-{name}-{hashlib.md5(dockerfile.encode("utf-8")).hexdigest()}'

    try:
        docker_client.images.get(tag)
    except ImageNotFound as e:
        dockerfile = BytesIO(dockerfile.encode('utf-8'))
        docker_client.images.build(fileobj=dockerfile, tag=tag, rm=True, forcerm=True)

    return tag

def add_stage(stage: StageIn) -> StageOut:
    with SessionLocal() as db:
        db.expire_on_commit = False
        return add_stage(stage)

def build_worker(run: Run, build_finished):
    config_raw = requests.get(run.config_url, headers={ 'Authorization': f'Bearer {run.token}' }).text
    config = parse_config(config_raw)

    waiting_for = -1
    checkout_stage = add_stage(StageIn(
        run_id=run.id,
        waiting_for=waiting_for,
        name='checkout',
        image_tag=RUNNER_CHECKOUTER_TAG,
        env_vars={
            'REPO_URL': run.clone_url,
            'COMMIT_ID': run.commit_id
        },
    ))
    waiting_for = checkout_stage.id

    for stage_name, stage in config.stages.values():
        stage_tag = build_stage(stage_name, stage, config.image)

        stage = add_stage(StageIn(
            run_id=run.id,
            waiting_for=waiting_for,
            name=stage_name,
            image_tag=stage_tag,
            env_vars={}
        ))
        waiting_for = stage.id

    add_stage(StageIn(
        run_id=run.id,
        waiting_for=waiting_for,
        name='cleanup',
        image_tag=RUNNER_CLEANUP_TAG,
        env_vars={}
    ))
    
    build_finished()
