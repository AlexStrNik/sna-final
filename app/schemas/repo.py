from pydantic import BaseModel

from .user import User


class RepoBase(BaseModel):
    id: str
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


class RepoWithOwner(Repo):
    owner: User
