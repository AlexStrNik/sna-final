from fastapi import FastAPI
from starlette.middleware.sessions import SessionMiddleware

from .routers import auth, api, webhook
from .database import Base, engine
from .constants import SESSION_SECRET

app = FastAPI()
app.add_middleware(SessionMiddleware, secret_key=SESSION_SECRET)
app.include_router(api.router)
app.include_router(auth.router)
app.include_router(webhook.router)

Base.metadata.create_all(bind=engine)

@app.get("/")
async def index():
    return { 'message': 'todo' }
