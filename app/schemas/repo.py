from typing import Mapping
from datetime import datetime
from pydantic import BaseModel

from .user import UserBase

def convert_datetime(dt: datetime) -> str:
    return dt.strftime('%d/%m/%Y')


class RepoBase(BaseModel):
    id: int
    name: str
    html_url: str
    hooks_url: str
    created_at: datetime
    pushed_at: datetime
    stargazers_count: int
    watchers_count: int

    class Config:
        json_encoders = {
            datetime: convert_datetime
        }


class Repo(RepoBase):
    full_name: str
    clone_url: str
    contents_url: str
    pass


class RepoIn(RepoBase):
    pass


class RepoOut(RepoBase):
    webhook_active: bool
    env_vars: Mapping[str, str]


class RepoWithOwner(Repo):
    owner: UserBase


class RepoWithLanguages(RepoOut):
    languages: Mapping[str, int]
