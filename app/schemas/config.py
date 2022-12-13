from typing import List, Mapping, Optional
from pydantic import BaseModel


class Stage(BaseModel):
    image: Optional[str]
    steps: List[str]
    artifacts: Optional[List[str]]


class Config(BaseModel):
    image: Optional[str]
    branches: List[str]
    stages: Mapping[str, Stage]
