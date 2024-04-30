#!/bin/bash

# Default value for rebuild argument
rebuild=false

# Default value for fulldepth argument
fulldepth=false

# Parse command line arguments
for arg in "$@"; do
    case $arg in
        --rebuild=*)
        rebuild="${arg#*=}"
        shift
        ;;
        --rebuild)
        rebuild=true
        shift
        ;;
        *)
        # Unknown option
        ;;
    esac
    case $arg in
        --fulldepth=*)
        fulldepth="${arg#*=}"
        shift
        ;;
        --fulldepth)
        fulldepth=true
        shift
        ;;
        *)
        # Unknown option
        ;;
    esac
done
# echo "Rebuild value: $rebuild"

# Step 1: Create a new directory
mkdir dat-dev
cd dat-dev || exit

# Step 2: Clone a list of repos from Git
repos=(
    "https://github.com/dat-labs/dat-api.git"
    "https://github.com/dat-labs/dat-orchestrator.git"
    "https://github.com/dat-labs/dat-telemetry.git"
    "https://github.com/dat-labs/dat-api-sdk.git"
    "https://github.com/dat-labs/dat-scheduler.git"
    "https://github.com/dat-labs/dat-ui.git"
    "https://github.com/dat-labs/dat-core.git"
    "https://github.com/dat-labs/verified-sources.git"
    "https://github.com/dat-labs/verified-generators.git"
    "https://github.com/dat-labs/verified-destinations.git"
)

for repo in "${repos[@]}"; do
    if [ "$fulldepth" = true ]; then
        git clone  "$repo"
    else
        git clone --depth=1 "$repo"
    fi
done

# Step 3: Create a directory named db-scripts
mkdir db-scripts

# Step 4: Download an SQL file via curl and save it in db-scripts directory
curl -o db-scripts/001-create-db-seed.sql https://raw.githubusercontent.com/dat-labs/dat-main/main/db-scripts/001-create-db-seed.sql

# Step 5: Download a docker-compose file via curl
curl -o docker-compose.yml https://raw.githubusercontent.com/dat-labs/dat-main/feature/local-dev-docker-setup/docker-compose-dev.yml

# Step 6: Run docker compose build
if [ "$rebuild" = true ]; then
    docker compose build
fi

# Step 7: Run docker compose up
docker compose up