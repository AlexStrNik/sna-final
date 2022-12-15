import os
from dotenv import load_dotenv

load_dotenv()

GITHUB_API_BASE = 'https://api.github.com'

SQLALCHEMY_DATABASE_URL = os.environ.get('SQLALCHEMY_DATABASE_URL')

RUNNER_CONFIG_NAME = os.environ.get('RUNNER_CONFIG_NAME')
RUNNER_MAX_BUILDERS = int(os.environ.get('RUNNER_MAX_BUILDERS'))
RUNNER_MAX_WORKERS = int(os.environ.get('RUNNER_MAX_WORKERS'))
RUNNER_CHECKOUTER_TAG = os.environ.get('RUNNER_CHECKOUTER_TAG')
RUNNER_CLEANUP_TAG = os.environ.get('RUNNER_CLEANUP_TAG')
RUNNER_TAG_PREFIX = os.environ.get('RUNNER_TAG_PREFIX')
RUNNER_TMP_DIR = os.environ.get('RUNNER_TMP_DIR')
RUNNER_ARTIFACTS_DIR = os.environ.get('RUNNER_ARTIFACTS_DIR')
RUNNER_LOGS_DIR = os.environ.get('RUNNER_LOGS_DIR')
