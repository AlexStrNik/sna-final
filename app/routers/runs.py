from typing import List
from sqlalchemy.orm import Session
from fastapi import APIRouter, Depends, HTTPException

from ..dependencies import user_from_token, get_db
from ..schemas.user import User
from ..schemas.run import RunOut, RunIn
from ..schemas.stage import StageOut
from ..crud.run import get_runs, get_run_by_id, add_run
from ..crud.stage import get_stages
from ..runner.external import start_builder

router = APIRouter(prefix='/api/runs')

@router.get('/', response_model=List[RunOut])
async def list_runs(user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    return get_runs(db, for_user=user.id)

@router.get('/{run_id}', response_model=RunOut)
async def get_run(run_id: int, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    return get_run_by_id(db, run_id=run_id, for_user=user.id)

@router.post('/{run_id}/restart', response_model=RunOut)
async def restart_run(run_id: int, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    old_run = get_run_by_id(db, run_id=run_id, for_user=user.id)

    if not old_run:
        raise HTTPException(status_code=404, detail=f'run {run_id} not found for user {user.id}')
    
    new_run = add_run(db, RunIn(
        user_id=old_run.user_id,
        repo_id=old_run.repo_id,
        branch_name=old_run.branch_name,
        commit_id=old_run.commit_id,
        commit_message=old_run.commit_message,
        commit_url=old_run.commit_url,
        clone_url=old_run.clone_url,
        config_url=old_run.config_url,
        token=old_run.token
    ))

    start_builder()

    return new_run

@router.get('/{run_id}/stages', response_model=List[StageOut])
async def list_stages(run_id: int, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    run = get_run_by_id(db, run_id=run_id, for_user=user.id)

    if not run:
        raise HTTPException(status_code=404, detail=f'run {run_id} not found for user {user.id}')

    return get_stages(db, for_run=run_id)