import yaml
from os import path
from docker.errors import ImageNotFound

from ..constants import RUNNER_CHECKOUTER_TAG
from ..schemas.config import Config
from .docker_client import docker_client

def parse_config(config_raw: str):
    config_raw = yaml.safe_load(config_raw)
    config = Config.parse_obj(config_raw)

    for stage_name, stage in config.stages.values():
        if not stage.image and not config.image:
            raise Exception(f'cannot resolve `image` for stage `{stage_name}`')

    return config

def build_checkouter():
    try:
        docker_client.images.get('checkouter')
    except ImageNotFound:
        docker_client.images.build(path=path.join(path.dirname(__file__), 'checkouter'), tag=RUNNER_CHECKOUTER_TAG, rm=True, forcerm=True)
