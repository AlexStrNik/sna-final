import requests
from typing import List, Mapping
from sqlalchemy.orm import Session
from starlette.requests import Request
from fastapi import APIRouter, Depends, HTTPException

from ..utils import url_for_query
from ..constants import GITHUB_API_BASE
from ..dependencies import user_from_token, get_db
from ..crud.repo_settings import get_settings, set_settings
from ..crud.run import get_runs
from ..schemas.user import User
from ..schemas.repo import RepoOut, RepoWithLanguages

router = APIRouter(prefix='/api/repos')

@router.get('/', response_model=List[RepoOut])
async def list_repos(user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.get(f'{GITHUB_API_BASE}/user/repos?type=owner&sort=created&per_page=100', headers={ 'Authorization': f'Bearer {user.access_token}' })

    repos = { repo['id']: RepoOut(**repo, webhook_active=False, env_vars={}) for repo in resp.json() }
    settings = get_settings(db, for_repos=[repo.id for repo in repos.values()])

    for setting in settings:
        repos[setting.repo_id].webhook_active = setting.webhook_active
        repos[setting.repo_id].env_vars = setting.env_vars

    return list(repos.values())

@router.get('/{repo_id}', response_model=RepoWithLanguages)
def get_repo(repo_id: int, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.get(f'{GITHUB_API_BASE}/repositories/{repo_id}', headers={ 'Authorization': f'Bearer {user.access_token}' })
    repo = resp.json()

    if repo['owner']['id'] != user.id:
        raise HTTPException(status_code=403, detail='not authorized')

    languages = requests.get(repo['languages_url'], headers={ 'Authorization': f'Bearer {user.access_token}' })
    languages = languages.json()

    repo = RepoWithLanguages(**repo, languages=languages, webhook_active=False, env_vars={})

    settings = get_settings(db, for_repo=repo.id)

    if settings:
        repo.env_vars = settings.env_vars
        repo.webhook_active = settings.webhook_active

    return get_runs(db, for_repo=repo_id)

@router.get('/{repo_id}/runs')
async def get_runs_for_repo(repo_id: int, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.get(f'{GITHUB_API_BASE}/repositories/{repo_id}', headers={ 'Authorization': f'Bearer {user.access_token}' })
    repo = resp.json()

    if repo['owner']['id'] != user.id:
        raise HTTPException(status_code=403, detail='not authorized')

    return get

@router.post('/{repo_id}/add-webhook')
async def add_webhook_for_repo(repo_id: int, request: Request, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.get(f'{GITHUB_API_BASE}/repositories/{repo_id}', headers={ 'Authorization': f'Bearer {user.access_token}' })
    repo = resp.json()

    if repo['owner']['id'] != user.id:
        raise HTTPException(status_code=403, detail='not authorized')

    resp = requests.post(repo['hooks_url'], headers={ 'Authorization': f'Bearer {user.access_token}' }, json={
        'name': 'web',
        'config': {
            'url': url_for_query(request, 'webhook', token=user.access_token),
            'content_type': 'json',
            'insecure_ssl': '0'
        },
        'events': [
            'push', 'pull_request'
        ],
        'active': True
    })
    resp = resp.json()

    if 'errors' in resp:
        raise HTTPException(status_code=400, detail=resp['errors'][0]['message'])

    set_settings(db, for_repo=repo_id, webhook_active=True)

    return { 'status': 'ok' }

@router.patch('/{repo_id}/env-vars')
async def set_env_vars_for_repo(repo_id: int, env_vars: Mapping[str, str], user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.get(f'{GITHUB_API_BASE}/repositories/{repo_id}', headers={ 'Authorization': f'Bearer {user.access_token}' })
    repo = resp.json()

    if repo['owner']['id'] != user.id:
        raise HTTPException(status_code=403, detail='not authorized')
    
    set_settings(db, for_repo=repo_id, env_vars=env_vars)
    
    return { 'status': 'ok' }
