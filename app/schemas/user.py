import typing
from pydantic import BaseModel


class UserBase(BaseModel):
    id: str
    name: str
    avatar_url: str


class User(UserBase):
    login: str
    repos_url: str
    access_token: typing.Any


class UserOut(UserBase):
    pass
