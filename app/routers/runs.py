from typing import List
from sqlalchemy.orm import Session
from fastapi import APIRouter, Depends, HTTPException

from ..dependencies import user_from_session, get_db
from ..schemas.user import User
from ..schemas.run import RunOut
from ..schemas.stage import StageOut
from ..crud.run import get_runs, get_run_by_id
from ..crud.stage import get_stages

router = APIRouter(prefix='/api/runs')

@router.get('/', response_model=List[RunOut])
async def list_runs(user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    return get_runs(db, for_user=user.id)

@router.get('/{run_id}', response_model=RunOut)
async def get_run(run_id: int, user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    return get_run_by_id(db, run_id=run_id, for_user=user.id)

@router.get('/{run_id}/stages', response_model=List[StageOut])
async def list_stages(run_id: int, user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    run = get_run_by_id(db, run_id=run_id, for_user=user.id)

    if not run:
        raise HTTPException(status_code=404, detail=f'run {run_id} not found for user {user.id}')

    return get_stages(db, for_run=run_id)