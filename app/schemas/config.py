from typing import List
from pydantic import BaseModel


class Config(BaseModel):
    branches: List[str]