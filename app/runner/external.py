from threading import Thread

from ..constants import RUNNER_MAX_WORKERS, RUNNER_MAX_BUILDERS
from ..database import SessionLocal
from ..schemas.run import RunStatus
from ..schemas.stage import StageStatus
from ..crud.run import get_next_run
from ..crud.stage import get_next_stage
from .builder import build_worker
from .runner import run_worker

current_workers = 0
current_builders = 0

def start_builder():
    global current_builders

    if current_builders >= RUNNER_MAX_BUILDERS:
        return

    run = None
    with SessionLocal() as db:
        db.expire_on_commit = False
        run = get_next_run(db)

        if run == None:
            return

        run.status = RunStatus.Running
        db.commit()

    current_builders += 1

    builder_thread = Thread(target=build_worker, args=(run, build_finished))
    builder_thread.start()

def build_finished():
    global current_builders

    current_builders -= 1
    start_runner()
    start_builder()

def start_runner():
    global current_workers

    if current_workers >= RUNNER_MAX_WORKERS:
        return

    stage = None
    with SessionLocal() as db:
        db.expire_on_commit = False
        stage = get_next_stage(db)

        if stage == None:
            return

        stage.status = StageStatus.Running
        db.commit()

    current_workers += 1

    runner_thread = Thread(target=run_worker, args=(stage, run_finished))
    runner_thread.start()

def run_finished():
    global current_workers

    current_workers -= 1
    start_runner()

def check_waiting_runs():
    for _ in range(RUNNER_MAX_BUILDERS):
        start_builder()

def chech_ready_stages():
    for _ in range(RUNNER_MAX_WORKERS):
        start_runner()
