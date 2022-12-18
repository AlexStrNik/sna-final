import requests
from fastapi import APIRouter, HTTPException, Header, Depends
from sqlalchemy.orm import Session

from ..constants import RUNNER_CONFIG_NAME
from ..schemas.run import RunIn
from ..crud.run import add_run
from ..schemas.webhook_event import EventPushed
from ..runner.utils import parse_config
from ..runner.external import start_builder
from ..dependencies import get_db

router = APIRouter()

@router.post('/webhook')
async def webhook(token: str, event: EventPushed, x_github_event: str = Header(), db: Session = Depends(get_db)):
    if x_github_event != 'push':
        raise HTTPException(status_code=400, detail='skipping event, only push are supported for now')

    access_token = { 'access_token': token, 'type': 'bearer' }

    if not event.ref.startswith('refs/heads/'):
        raise HTTPException(status_code=400, detail='skipping event, only branches are supported for now')
    
    branch_name = event.ref.replace('refs/heads/', '')

    config_url = f'{event.repository.contents_url.replace("{+path}", RUNNER_CONFIG_NAME)}?ref={event.head_commit.id}'
    
    config_info = requests.get(config_url, headers={ 'Authorization': f'Bearer {access_token}' })
    config_info = config_info.json()

    if 'message' in config_info and config_info['message'] == 'Not Found':
        raise HTTPException(status_code=400, detail=f'skipping event, {RUNNER_CONFIG_NAME} not found in repo')

    download_url = config_info['download_url']
    config = requests.get(download_url, headers={ 'Authorization': f'Bearer {access_token}' })
    try:
        config = parse_config(config.text)
    except Exception as full_detail:
        raise HTTPException(status_code=400, detail=f'skipping event, validation failed. {full_detail}')

    if branch_name not in config.branches:
        raise HTTPException(status_code=400, detail=f'skipping event, branch {branch_name} not listed in config')

    add_run(db, RunIn(
        user_id=event.repository.owner.id,
        repo_id=event.repository.id,
        branch_name=branch_name,
        commit_id=event.head_commit.id,
        commit_message=event.head_commit.message,
        commit_url=event.head_commit.url,
        clone_url=event.repository.clone_url.replace('github.com', f'{token}@github.com', 1),
        config_url=download_url,
        token=token
    ))

    start_builder()

    return { 'status': 'ok' }
