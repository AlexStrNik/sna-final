from fastapi import FastAPI

from .routers import auth, api, webhook, runs, stages
from .database import Base, engine
from .runner.external import check_waiting_runs, chech_ready_stages
from .runner.utils import build_checkouter

app = FastAPI()
app.include_router(api.router)
app.include_router(runs.router)
app.include_router(stages.router)
app.include_router(auth.router)
app.include_router(webhook.router)

Base.metadata.create_all(bind=engine)

build_checkouter()
check_waiting_runs()
chech_ready_stages()

@app.get('/')
async def index():
    return { 'message': 'todo' }
