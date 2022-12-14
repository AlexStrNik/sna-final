from threading import Thread

from ..constants import RUNNER_MAX_WORKERS, RUNNER_MAX_BUILDERS
from ..database import SessionLocal
from ..schemas.run import RunStatus
from ..crud.run import get_next_run
from .builder import build_worker

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
    start_builder()

def check_waiting_runs():
    for _ in range(RUNNER_MAX_BUILDERS):
        start_builder()
