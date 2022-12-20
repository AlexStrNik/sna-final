from os import path
from docker.errors import ImageNotFound

from ..constants import RUNNER_CHECKOUTER_TAG
from .docker_client import docker_client

def build_checkouter():
    try:
        docker_client.images.get(RUNNER_CHECKOUTER_TAG)
    except ImageNotFound:
        docker_client.images.build(
            path=path.join(path.dirname(__file__), 'checkouter'), 
            tag=RUNNER_CHECKOUTER_TAG, 
            rm=True, 
            forcerm=True
        )
