import yaml
from ..schemas.config import Config

def parse_config(config_raw: str):
    config_raw = yaml.safe_load(config_raw)
    config = Config.parse_obj(config_raw)

    for stage_name, stage in config.stages.items():
        if not stage.image and not config.image:
            raise Exception(f'cannot resolve `image` for stage `{stage_name}`')

        if not stage.image:
            stage.image = config.image

    return config
