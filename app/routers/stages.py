import os
from os import path
from typing import List
from sqlalchemy.orm import Session
from fastapi import APIRouter, Depends, HTTPException
from fastapi.responses import FileResponse

from ..constants import RUNNER_LOGS_DIR, RUNNER_ARTIFACTS_DIR
from ..dependencies import user_from_session, get_db
from ..schemas.user import User
from ..schemas.stage import StageOut
from ..crud.stage import get_stage_by_id

router = APIRouter(prefix='/api/stages')

@router.get('/{stage_id}', response_model=StageOut)
async def get_stage(stage_id: int, user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    return get_stage_by_id(db, stage_id=stage_id, for_user=user.id)

@router.get('/{stage_id}/logs')
async def get_stage_logs(stage_id: int, user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    stage = get_stage_by_id(db, stage_id=stage_id, for_user=user.id)

    if not stage:
        raise HTTPException(status_code=404, detail=f'stage {stage_id} not found for user {user.id}')

    return FileResponse(path.join(os.getcwd(), RUNNER_LOGS_DIR, str(stage.run_id), f'{stage.name}.log'))

@router.get('/{stage_id}/artifacts', response_model=List[str])
async def list_stage_artifacts(stage_id: int, user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    stage = get_stage_by_id(db, stage_id=stage_id, for_user=user.id)

    if not stage:
        raise HTTPException(status_code=404, detail=f'stage {stage_id} not found for user {user.id}')

    return os.listdir(path.join(os.getcwd(), RUNNER_ARTIFACTS_DIR, str(stage_id)))

@router.get('/{stage_id}/artifacts/{artifact_path}')
async def get_stage_artifact(stage_id: int, artifact_path: str, user: User = Depends(user_from_session), db: Session = Depends(get_db)):
    stage = get_stage_by_id(db, stage_id=stage_id, for_user=user.id)

    if not stage:
        raise HTTPException(status_code=404, detail=f'stage {stage_id} not found for user {user.id}')

    return FileResponse(path.join(os.getcwd(), RUNNER_ARTIFACTS_DIR, str(stage_id), artifact_path))
