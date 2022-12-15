import requests
from typing import List
from sqlalchemy.orm import Session
from fastapi import APIRouter, Depends, HTTPException
from starlette.requests import Request

from ..constants import GITHUB_API_BASE
from ..dependencies import user_from_token, get_db
from ..schemas.user import User, UserOut
from ..schemas.repo import RepoIn, RepoOut
from ..crud.webhook import get_webhooks, add_webhook
from ..utils import url_for_query

router = APIRouter(prefix='/api')

@router.get('/user', response_model=UserOut)
async def get_user(user: User = Depends(user_from_token)):

    return user

@router.get('/repos', response_model=List[RepoOut])
async def list_repos(user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.get(f'{GITHUB_API_BASE}/user/repos?type=owner', headers={ 'Authorization': f'Bearer {user.access_token}' })

    repos = { repo['id']: RepoOut(**repo, webhook_active=False) for repo in resp.json() }
    webhooks = get_webhooks(db, for_repos=[repo.id for repo in repos.values()])

    for webhook in webhooks:
        repos[webhook.repo_id].webhook_active = True

    return list(repos.values())


@router.post('/add-webhook')
async def add_webhook_for_repo(repo: RepoIn, request: Request, user: User = Depends(user_from_token), db: Session = Depends(get_db)):
    resp = requests.post(repo.hooks_url, headers={ 'Authorization': f'Bearer {user.access_token}' }, json={
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

    add_webhook(db, for_repo=repo.id)

    return { 'status': 'ok' }
