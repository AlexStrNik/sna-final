import requests
from fastapi import HTTPException, Header

from .constants import GITHUB_API_BASE
from .database import SessionLocal
from .schemas.user import User

def user_from_token(token: str = Header()):
    user = requests.get(f'{GITHUB_API_BASE}/user', headers={ 'Authorization': f'Bearer {token}' }).json()

    if not 'id' in user:
        raise HTTPException(status_code=403, detail='not authenticated')

    return User(**user, access_token=token)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
