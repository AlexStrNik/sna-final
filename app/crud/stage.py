from sqlalchemy.orm import Session

from ..models.stage import Stage
from ..schemas.stage import StageIn

def get_stages(db: Session, for_run: int):
    return db.query(Stage).filter(Stage.run_id == for_run).all()

def add_stage(db: Session, stage: StageIn):
    db_stage = Stage(**stage.dict())
    db.add(db_stage)
    db.commit()
    db.refresh(db_stage)

    return db_stage

