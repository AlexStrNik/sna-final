from typing import List, Mapping, Optional
from pydantic import BaseModel, Field


class Stage(BaseModel):
    steps: List[str]
    artifacts: Optional[List[str]]
    dependencies: Optional[List[str]] = Field(..., alias='depends-on')


class Config(BaseModel):
    branches: List[str]
    stages: Mapping[str, Stage]
