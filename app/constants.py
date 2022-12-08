import os
from dotenv import load_dotenv

load_dotenv()

GITHUB_CLIENT_ID = os.environ.get('GITHUB_CLIENT_ID')
GITHUB_CLIENT_SECRET = os.environ.get('GITHUB_CLIENT_SECRET')
GITHUB_SCOPE = 'repo,admin:repo_hook'

SESSION_SECRET = os.environ.get('SESSION_SECRET')

SQLALCHEMY_DATABASE_URL = os.environ.get('SQLALCHEMY_DATABASE_URL')
