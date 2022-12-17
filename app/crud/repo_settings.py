from typing import List, Mapping
from sqlalchemy.orm import Session

from ..models.repo_settings import RepoSettings

def get_settings(db: Session, for_repo: int = None, for_repos: List[int] = None):
    if for_repo:
        return db.query(RepoSettings).filter(RepoSettings.repo_id == for_repo).first()
    
    return db.query(RepoSettings).filter(RepoSettings.repo_id.in_(for_repos)).all()
    
def set_settings(db: Session, for_repo: int, env_vars: Mapping[str, str] = None, webhook_active: bool = None):
    db_settings = RepoSettings(repo_id = for_repo)

    if env_vars != None:
        db_settings.env_vars = env_vars

    if webhook_active != None:
        db_settings.webhook_active = webhook_active

    db.merge(db_settings)
    db.commit()
    return True
