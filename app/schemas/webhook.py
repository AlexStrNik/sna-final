from pydantic import BaseModel


class Webhook(BaseModel):
    repo_id: str

    class Config:
        orm_mode = True
