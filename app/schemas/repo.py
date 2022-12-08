import typing
from pydantic import BaseModel


class RepoBase(BaseModel):
    id: str
    name: str


class Repo(RepoBase):
    pass


class RepoOut(RepoBase):
    pass

