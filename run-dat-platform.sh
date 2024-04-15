#!/bin/bash

# Step 1: Create a new directory
mkdir dat
cd dat || exit

# Step 2: Clone a list of repos from Git
repos=(
    "https://github.com/dat-labs/dat-api.git"
    "https://github.com/dat-labs/dat-orchestrator.git"
    "https://github.com/dat-labs/dat-telemetry.git"
    "https://github.com/dat-labs/dat-ui.git"
)

for repo in "${repos[@]}"; do
    git clone --depth=1 "$repo"
done

# Step 3: Create a directory named db-scripts
mkdir db-scripts

# Step 4: Download an SQL file via curl and save it in db-scripts directory
curl -o db-scripts/001-create-db-seed.sql https://raw.githubusercontent.com/dat-labs/dat-main/main/db-scripts/001-create-db-seed.sql

# Step 5: Download a docker-compose file via curl
curl -O https://raw.githubusercontent.com/dat-labs/dat-main/main/docker-compose.yml

# Step 6: Run docker compose build
docker compose build --no-cache

# Step 7: Run docker compose up
docker compose up

