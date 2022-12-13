import yaml

from ..schemas.config import Config

def parse_config(config_raw: str):
    config_raw = yaml.safe_load(config_raw)
    config = Config.parse_obj(config_raw)

    return config
