from sqlalchemy.orm import Session
from sqlalchemy import update

from ..models.stage import Stage
from ..schemas.stage import StageIn, StageStatus

def get_stages(db: Session, for_run: int):
    return db.query(Stage).filter(Stage.run_id == for_run).order_by(Stage.order).all()

def get_stage_by_id(db: Session, stage_id: int, for_user: int):
    return db.query(Stage).filter(Stage.user_id == for_user, Stage.id == stage_id).first()

def add_stage(db: Session, stage: StageIn):
    db_stage = Stage(**stage.dict())
    db.add(db_stage)
    db.commit()
    db.refresh(db_stage)

    return db_stage

def get_next_stage(db: Session):
    return db.query(Stage).filter(Stage.status == StageStatus.Ready).first()

def set_stage_status(db: Session, status: StageStatus, for_stage_id: int):
    db.execute(
        update(Stage).where(Stage.id == for_stage_id).values(status = status)
    )
    db.commit()

    return True
