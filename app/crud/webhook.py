from typing import List
from sqlalchemy.orm import Session

from ..models.webhook import Webhook

def get_webhook(db: Session, for_repo: int):
    return db.query(Webhook).filter(Webhook.repo_id == for_repo).first()

def get_webhooks(db: Session, for_repos: List[int]):
    return db.query(Webhook).filter(Webhook.repo_id.in_(for_repos)).all()

def add_webhook(db: Session, for_repo: int):
    db_webhook = Webhook(repo_id = for_repo)
    db.add(db_webhook)
    db.commit()
    return True
