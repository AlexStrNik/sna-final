from fastapi import APIRouter, Depends

from ..dependencies import user_from_token
from ..schemas.user import User, UserOut

router = APIRouter(prefix='/api')

@router.get('/user', response_model=UserOut)
async def get_user(user: User = Depends(user_from_token)):

    return user
