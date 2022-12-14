from pydantic import BaseModel

from .repo import RepoWithOwner
from .commit import Commit


class EventPushed(BaseModel):
    ref: str
    repository: RepoWithOwner
    head_commit: Commit
