from sqlalchemy.orm import Session

from ..models.run import Run
from ..schemas.run import RunIn, RunStatus

def get_runs(db: Session, for_user: int = None, for_repo: int = None):
    if for_repo:
        return db.query(Run).filter(Run.repo_id == for_repo).all()

    return db.query(Run).filter(Run.user_id == for_user).all()

def get_run_by_id(db: Session, run_id: int, for_user: int):
    return db.query(Run).filter(Run.user_id == for_user, Run.id == run_id).first()


def add_run(db: Session, run: RunIn):
    db_run = Run(**run.dict())
    db.add(db_run)
    db.commit()

    return db_run

def get_next_run(db: Session):
    return db.query(Run).filter(Run.status == RunStatus.Waiting).first()
