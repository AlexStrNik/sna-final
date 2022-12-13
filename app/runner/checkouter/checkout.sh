#!/bin/bash

git clone $REPO_URL sources
cd sources
git checkout $COMMIT_ID
