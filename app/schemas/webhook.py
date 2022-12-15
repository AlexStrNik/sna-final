from pydantic import BaseModel


class Webhook(BaseModel):
    repo_id: int

    class Config:
        orm_mode = True
