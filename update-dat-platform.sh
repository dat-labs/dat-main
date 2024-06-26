#!/bin/bash 

# Step 1: Stop any running docker images
docker compose down

# Step 2: Setting up variables
branch="main"
repo_name="dat*"

# Step 3: Update the repos starting with 'dat'
find . -type d -name "$repo_name" | while IFS= read dir; do
    echo "Updating: $dir"
    git -C $dir checkout "$branch" && git -C $dir pull
done

# Step 4: Download the docker-compose file via curl
curl -O https://raw.githubusercontent.com/dat-labs/dat-main/main/docker-compose.yml --silent

# Step 5: Build the images
docker compose build

# Step 6: Seed local database with verified-actors
docker compose up db-backend api -d
API_URL="http://localhost:8000/connections/list"

while true; do
    # Use curl to check if the API is reachable
    if curl -X 'GET' --output /dev/null -H 'accept: application/json' --silent --head --fail "$API_URL"; then
        echo "API is reachable. Exiting the loop."
        break
    else
        echo "API is not reachable. Sleeping for 1 second..."
        sleep 1
    fi
done


# Step 6.1: Download an sh file via curl and save it in sh-scripts directory
curl -o sh-scripts/actors-seed.sh https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors-seed.sh
curl -o sh-scripts/actors.csv https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors.csv


# Step 6.2 Execute the downloaded file
bash sh-scripts/actors-seed.sh

# Stop 
docker compose down

echo "Updated dat"