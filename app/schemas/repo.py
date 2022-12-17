from typing import Mapping
from pydantic import BaseModel

from .user import User


class RepoBase(BaseModel):
    id: int
    name: str
    html_url: str
    hooks_url: str


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
    owner: User
