from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .routers import auth, user, webhook, runs, stages, repos
from .database import Base, engine
from .runner.external import check_waiting_runs, chech_ready_stages
from .runner.utils import build_checkouter


app = FastAPI()

origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(user.router)
app.include_router(repos.router)
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
