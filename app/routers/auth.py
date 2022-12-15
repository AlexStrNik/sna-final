from fastapi import APIRouter, HTTPException
from fastapi.responses import HTMLResponse
from starlette.requests import Request
from starlette.responses import RedirectResponse
from authlib.integrations.starlette_client import OAuthError

from ..schemas.user import User
from ..oauth import github

router = APIRouter()

@router.get('/login/github')
async def login_via_github(request: Request):
    redirect_uri = request.url_for('auth_via_github')
    return await github.authorize_redirect(request, redirect_uri)

AUTH_RESPONSE = """
<!DOCTYPE html>
<title>Authentication complete</title>
<p>Authentication is complete. If this does not happen automatically, please
close the window.
<script>
  window.opener.postMessage({
    'flutter-web-auth': 'success'
  }, window.location.origin);
  window.close();
</script>
"""

@router.get('/auth/github', response_class=HTMLResponse)
async def auth_via_github(request: Request):
    token = None
    try:
        token = await github.authorize_access_token(request)
    except OAuthError as e:
        raise HTTPException(status_code=400, detail=e.description)

    resp = await github.get('user', token=token)
    user = resp.json()

    request.session['user'] = User(
        **user,
        access_token=token,
    ).dict()

    return AUTH_RESPONSE
