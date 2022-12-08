from fastapi import APIRouter, HTTPException
from starlette.requests import Request
from starlette.responses import RedirectResponse
from authlib.integrations.starlette_client import OAuthError

from ..schemas.user import User
from ..oauth import github

router = APIRouter()

@router.get("/login/github")
async def login_via_github(request: Request):
    redirect_uri = request.url_for('auth_via_github')
    return await github.authorize_redirect(request, redirect_uri)

@router.get("/auth/github")
async def auth_via_github(request: Request):
    token = None
    try:
        token = await github.authorize_access_token(request)
    except OAuthError as e:
        raise HTTPException(status_code=400, detail=e.description)

    resp = await github.get('user', token=token)
    user = resp.json()

    request.session['user'] = User(
        id=user['id'],
        name=user['name'],
        login=user['login'],
        access_token=token,
        avatar_url=user['avatar_url'],
        repos_url=user['repos_url']
    ).dict()

    return RedirectResponse("/")
