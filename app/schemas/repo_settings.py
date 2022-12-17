from typing import Mapping
from pydantic import BaseModel


class RepoSettings(BaseModel):
    repo_id: int
    webhook_active: bool
    env_vars: Mapping[str, str]

    class Config:
        orm_mode = True
