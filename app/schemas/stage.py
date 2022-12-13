from enum import Enum
from typing import List, Mapping, Optional
from pydantic import BaseModel


class StageStatus(str, Enum):
    Waiting = 'waiting',
    Running = 'running',
    Failed = 'failed',
    Success = 'success'


class Stage(BaseModel):
    name: str
    status: StageStatus
    artifacts: Optional[List[str]]


class StageIn(BaseModel):
    run_id: str
    waiting_for: int
    image_tag: str
    env_vars: Mapping[str, str]
    pass


class StageOut(BaseModel):
    id: int
