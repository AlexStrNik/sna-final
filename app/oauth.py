from authlib.integrations.starlette_client import OAuth

from .constants import GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET, GITHUB_SCOPE

oauth = OAuth()
oauth.register(
    name='github',
    client_id=GITHUB_CLIENT_ID,
    client_secret=GITHUB_CLIENT_SECRET,
    access_token_url='https://github.com/login/oauth/access_token',
    access_token_params=None,
    authorize_url='https://github.com/login/oauth/authorize',
    authorize_params=None,
    api_base_url='https://api.github.com/',
    client_kwargs={ 'scope': GITHUB_SCOPE },
)
github = oauth.create_client('github')
