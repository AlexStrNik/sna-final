from pydantic import BaseModel


class UserBase(BaseModel):
    id: int
    name: str
    avatar_url: str
    html_url: str


class User(UserBase):
    repos_url: str
    access_token: str


class UserOut(UserBase):
    pass
