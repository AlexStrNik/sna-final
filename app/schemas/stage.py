from enum import Enum
from typing import List, Mapping, Optional
from pydantic import BaseModel


class StageStatus(str, Enum):
    Ready = 'ready'
    Waiting = 'waiting'
    Running = 'running'
    Failed = 'failed'
    Success = 'success'


class Stage(BaseModel):
    name: str
    artifacts: Optional[List[str]]


class StageIn(Stage):
    run_id: str
    next_stage: int
    status: Optional[StageStatus]
    image_tag: str
    env_vars: Mapping[str, str]
    pass


class StageOut(Stage):
    id: int
    status: StageStatus

    class Config:
        orm_mode = True
