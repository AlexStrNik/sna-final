import requests

from ..models.run import Run
from .utils import parse_config

def build_worker(run: Run, build_finished):
    config_raw = requests.get(run.config_url, headers={ 'Authorization': f'Bearer {run.token}' }).text
    config = parse_config(config_raw)

    print(config)
    
    build_finished()
