from sqlalchemy import Column, Integer, String, Enum

from ..database import Base
from ..schemas.run import RunStatus


class Run(Base):
    __tablename__ = 'runs'

    id = Column(Integer, primary_key=True, index=True)
    status = Column(Enum(RunStatus), default=RunStatus.Waiting)
    user_id = Column(Integer)
    repo_id = Column(Integer)
    repo_name = Column(String)
    commit_id = Column(String)
    commit_url = Column(String)
    commit_message = Column(String)
    clone_url = Column(String)
    config_url = Column(String)
    token = Column(String)
