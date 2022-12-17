from sqlalchemy import Column, Integer, Boolean, JSON

from ..database import Base

class RepoSettings(Base):
    __tablename__ = 'repo_settings'

    repo_id = Column(Integer, primary_key=True, index=True)
    webhook_active = Column(Boolean, default=False)
    env_vars = Column(JSON, default={})
