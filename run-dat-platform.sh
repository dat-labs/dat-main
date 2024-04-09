#!/bin/bash

# Step 1: Create a new directory
mkdir dat
cd dat || exit

# Step 2: Clone a list of repos from Git
repos=(
    "https://github.com/dat-labs/dat-api.git"
    "https://github.com/dat-labs/dat-orchestrator.git"
    "https://github.com/dat-labs/dat-telemetry.git"
    # "https://github.com/dat-labs/dat-ui.git"
)

for repo in "${repos[@]}"; do
    git clone --depth=1 "$repo"
done

# Step 3: Create a directory named db-scripts
mkdir db-scripts

# Step 4: Download an SQL file via curl and save it in db-scripts directory
# curl -o db-scripts/database_dump.sql https://gist.githubusercontent.com/riju-dc/3aa36bbe655eb0eb0bc5f25cf340de2e/raw/52d630cfa526ba6f3d294edad60eb995db79ded1/001-create-db-seed.sql

# Step 5: Download a docker-compose file via curl
# curl -O https://gist.githubusercontent.com/riju-dc/e9805fc1fc8be0f2b141a52006560630/raw/a60641ac022678aa3fc6d1e72e7532283eb89d3b/dat-docker-compose.yml

# Step 6: Run docker compose build
docker compose build

# Step 7: Run docker compose up
docker compose up

