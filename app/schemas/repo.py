from pydantic import BaseModel


class RepoBase(BaseModel):
    id: str
    name: str
    webhook_active: bool


class Repo(RepoBase):
    pass


class RepoOut(RepoBase):
    pass

