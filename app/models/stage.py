from sqlalchemy import Column, Integer, String, Enum, JSON

from ..database import Base
from ..schemas.stage import StageStatus


class Stage(Base):
    __tablename__ = 'stages'

    id = Column(Integer, primary_key=True, index=True)
    order = Column(Integer)
    run_id = Column(Integer)
    name = Column(String)
    status = Column(Enum(StageStatus), default=StageStatus.Waiting)
    next_stage = Column(Integer)
    image_tag = Column(String)
    env_vars = Column(JSON)
    artifacts = Column(JSON)
