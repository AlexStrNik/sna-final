from starlette.requests import Request
from fastapi import APIRouter

router = APIRouter()

@router.get("/webhook")
async def webhook(request: Request):
    pass
