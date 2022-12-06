from hashlib import md5
import os
from shutil import copytree
from threading import Thread
import uuid
import yaml
import docker
from yaspin import yaspin
from enum import Enum
from io import BytesIO
import shlex

import typing


class JobStatus(Enum):
    Fail = 0
    Success = 1
    Waiting = 2


class Job:
    name: str = None
    image: str = None
    steps: typing.List[str] = None
    artifacts: typing.List[str] = None
    depends_on: typing.List[str] = None
    tag: str = None

    def __init__(self, name, image, steps, artifacts, depends_on):
        self.name = name
        self.image = image
        self.steps = steps
        self.artifacts = artifacts
        self.depends_on = depends_on


    def build(self,):
        dockerfile = f'''
        FROM {self.image}
        
        RUN touch .steps.sh
        '''
        for step in self.steps:
            dockerfile += f'RUN echo {shlex.quote(step)} >> .steps.sh\n'
        dockerfile += f'''
        RUN mkdir job-{self.name}
        WORKDIR job-{self.name}

        ENTRYPOINT ["/bin/bash", "/.steps.sh"]
        '''

        self.tag = f'dumb-ci-job-{self.name}-{md5(dockerfile.encode("utf-8")).hexdigest()}'

        try:
            docker_client.images.get(self.tag)
        except docker.errors.ImageNotFound:
            with yaspin(text=f'Building docker image for job `{self.name}`...') as spinner:
                dockerfile = BytesIO(dockerfile.encode('utf-8'))
                docker_client.images.build(fileobj=dockerfile, tag=self.tag, rm=True, forcerm=True)

                spinner.green.ok('✔')

            return

        print(f'✔ Docker image for job `{self.name}` already exists.')
        return


docker_client = docker.from_env()


def parse_config(raw: str):
    config = None

    with yaspin(text='Parsing configuration file...') as spinner:
        config = yaml.safe_load(raw)
        spinner.green.ok('✔')

    return config

def parse_jobs(config: typing.Mapping[str, typing.Any]):
    jobs = {}

    with yaspin(text='Parsing jobs...') as spinner:
        for job_name, job_config in config['jobs'].items():
            if 'image' not in job_config and 'image' not in config:
                raise Exception(f'job `{job_name}` hasn\'t specified docker image and fallback image isn\'t set')

            if 'steps' not in job_config:
                raise Exception(f'job `{job_name}` hasn\'t specified commands to run')

            jobs[job_name] = Job(
                name = f'{config["name"]}-{job_name}',
                image = job_config.get('image', config['image']),
                steps = job_config['steps'],
                artifacts = job_config.get('artifacts'),
                depends_on = job_config.get('depends-on', [])
            )
        
        spinner.green.ok('✔')

    return jobs

def validate_dependecy_graph(jobs: typing.Mapping[str, Job]):
    def has_cycle(job: Job, path):
        for dependency in job.depends_on:
            if dependency in path:
                return [*path, dependency]
            
            cycle = has_cycle(jobs[dependency], [*path, dependency])
            if cycle is not None:
                return cycle

        return None

    with yaspin(text='Validating dependency graph...') as spinner:
        for job_name, job_config in jobs.items():
            if len(job_config.depends_on) == 0:
                continue

            for dependency in job_config.depends_on:
                if not dependency in jobs:
                    raise Exception(f'job `{job_name}` depends on unknown job `{dependency}`')

            cycle = has_cycle(job_config, [job_name])
            if cycle is not None:
                raise Exception(f'job `{job_name}` has cyclic dependency `{" -> ".join(cycle)}`')

        spinner.green.ok('✔')
            
def build_jobs(jobs: typing.List[Job]):
    with yaspin(text='Building images for jobs...') as spinner:
        for job in jobs:
            with spinner.hidden():
                job.build()
        
        spinner.green.ok('✔')

def parse_and_build(raw: str):
    config = parse_config(raw)
    jobs = parse_jobs(config)
    validate_dependecy_graph(jobs)
    build_jobs(jobs.values())

    return jobs

def run_jobs(jobs: typing.Mapping[str, Job]):
    run_id = uuid.uuid4()
    os.makedirs(f'{os.getcwd()}/runs/{run_id}')

    job_statuses = { job_name: JobStatus.Waiting for job_name in jobs.keys() }

    def job_worker(job_name, job: Job, statuses, run_ready):
        os.makedirs(f'{os.getcwd()}/runs/{run_id}/{job_name}/volume')

        for dependency in job.depends_on:
            for artifact in jobs[dependency].artifacts:
                artifact_src = os.path.join(f'{os.getcwd()}/runs/{run_id}/{dependency}/volume', artifact)
                artifact_dst = os.path.join(f'{os.getcwd()}/runs/{run_id}/{job_name}/volume', artifact)
                copytree(artifact_src, artifact_dst)

        container = docker_client.containers.run(
            job.tag, 
            detach=True,  
            volumes={ f'{os.getcwd()}/runs/{run_id}/{job_name}/volume': { 'bind': f'/job-{job.name}', 'mode': 'rw' } }
        )

        with open(f'{os.getcwd()}/runs/{run_id}/{job_name}/volume/log', 'wb') as log:
            for log_line in container.logs(stream=True, stdout=True, stderr=True):
                # TODO: notify UI
                log.write(log_line)
                log.flush()

        status = container.wait()
        container.remove()

        # TODO: notify UI
        if status['StatusCode'] == 0:
            statuses[job_name] = JobStatus.Success
            run_ready()
        else:
            statuses[job_name] = JobStatus.Fail

    def run_ready_jobs():
        for job_name, job in jobs.items():
            if job_statuses[job_name] is JobStatus.Waiting and all(job_statuses[dependency] is JobStatus.Success for dependency in job.depends_on):
                Thread(target=job_worker, args=[job_name, job, job_statuses, run_ready_jobs]).start()

    run_ready_jobs()

jobs = parse_and_build(open('./test/html-differ.yaml').read())

run_jobs(jobs)