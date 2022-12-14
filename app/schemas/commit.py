from pydantic import BaseModel


class Commit(BaseModel):
    id: str
    url: str
    message: str
