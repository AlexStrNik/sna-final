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


class StageIn(Stage):
    user_id: int
    next_stage: int
    order: int
    run_id: int
    status: Optional[StageStatus]
    image_tag: str
    artifacts: Optional[List[str]]
    env_vars: Mapping[str, str]


class StageOut(Stage):
    id: int
    status: StageStatus

    class Config:
        orm_mode = True

class StageInternal(StageIn, StageOut):
    pass