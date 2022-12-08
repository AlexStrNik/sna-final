from fastapi import HTTPException
from starlette.requests import Request

from .schemas.user import User

def user_from_session(request: Request):
    if not 'user' in request.session:
        raise HTTPException(status_code=403, detail='not authenticated')

    return User(**request.session['user'])
