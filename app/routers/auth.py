import requests
from fastapi import APIRouter
from fastapi.responses import HTMLResponse

from ..constants import GITHUB_API_BASE, GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET

router = APIRouter()

@router.get('/auth', response_class=HTMLResponse)
def auth_response(code: str):
    res = requests.post(f'{GITHUB_API_BASE}', params={
        'client_id': GITHUB_CLIENT_ID,
        'client_secret': GITHUB_CLIENT_SECRET,
        'code': code
    }, headers={
        'Accept': 'application/json'
    }).json()

    return f"""
        <!DOCTYPE html>
        <title>Authentication complete</title>
        <p>Authentication is complete. If this does not happen automatically, please
        close the window.
        <script>
        window.opener.postMessage({
            'flutter-web-auth': {res['access_token']}
        }, '*');
        window.close();
        </script>
    """
