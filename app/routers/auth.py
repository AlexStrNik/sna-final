import requests
from fastapi import APIRouter
from fastapi.responses import HTMLResponse

from ..constants import GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET

router = APIRouter()

@router.get('/auth', response_class=HTMLResponse)
def auth_response(code: str):
    res = requests.post(f'https://github.com/login/oauth/access_token', params={
        'client_id': GITHUB_CLIENT_ID,
        'client_secret': GITHUB_CLIENT_SECRET,
        'code': code
    }, headers={
        'Accept': 'application/json'
    }).json()

    return (
        "<!DOCTYPE html>"
        "<title>Authentication complete</title>"
        "<p>Authentication is complete. If this does not happen automatically, please "
        "close the window."
        "<script>"
        "window.opener.postMessage({"
        f"    'flutter-web-auth': '{res.get('access_token', 'error')}'"
        "}, '*');"
        "window.close();"
        "</script>"
    )
