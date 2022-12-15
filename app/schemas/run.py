from enum import Enum
from pydantic import BaseModel


class RunStatus(str, Enum):
    Waiting = 'waiting'
    Running = 'running'
    Failed = 'failed'
    Success = 'success'


class RunBase(BaseModel):
    user_id: int
    repo_id: int
    repo_name: str
    commit_id: str
    commit_url: str
    commit_message: str

    class Config:
        orm_mode = True


class RunIn(RunBase):
    token: str
    clone_url: str
    config_url: str

class RunOut(RunBase):
    id: int
    status: RunStatus
