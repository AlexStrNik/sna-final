from typing import List
from fastapi import APIRouter, Depends, HTTPException
from starlette.requests import Request

from ..schemas.user import User, UserOut
from ..schemas.repo import RepoOut
from ..dependencies import user_from_session
from ..oauth import github

router = APIRouter()

@router.get("/api/user", response_model=UserOut)
async def get_user(user: User = Depends(user_from_session)):
    resp = await github.get('user', token=user.access_token)

    return resp.json()

@router.get("/api/repos", response_model=List[RepoOut])
async def list_repos(user: User = Depends(user_from_session)):
    resp = await github.get(user.repos_url, token=user.access_token)

    return resp.json()


@router.get("/api/add-webhook/{name}")
async def add_webhook_for_repo(name: str, request: Request, user: User = Depends(user_from_session)):
    resp = await github.post(f'/repos/{user.login}/{name}/hooks', token=user.access_token, json={
        'name': 'web',
        'config': {
            'url': request.url_for('webhook'),
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

    return { 'status': 'ok' }