from sqlalchemy import Column, Integer

from ..database import Base

class Webhook(Base):
    __tablename__ = 'webhooks'

    repo_id = Column(Integer, primary_key=True, index=True)
