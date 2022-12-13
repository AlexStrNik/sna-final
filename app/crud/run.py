from sqlalchemy.orm import Session

from ..models.run import Run
from ..schemas.run import RunIn, RunStatus

def get_runs(db: Session, for_user: int):
    return db.query(Run).filter(Run.user_id == for_user).all()

def add_run(db: Session, run: RunIn):
    db_run = Run(**run.dict())
    db.add(db_run)
    db.commit()

    return True

def get_next_run(db: Session):
    return db.query(Run).filter(Run.status == RunStatus.Waiting).first()
