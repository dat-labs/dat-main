#!/bin/bash

# Default value for rebuild argument
rebuild=false

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
done
# echo "Rebuild value: $rebuild"
echo "     +@@#. +#*+-                      %@-                 #%=    
     @@@@- #@@@@@#:                  .@@+                 @@*    
      --.  -#@@@@@@*                 .@@+                 @@*    
              :#@@@@*       .+#@@@%#=.@@+   :+#@@@@#+: .**@@%**+ 
 #@@%-. .=%@@*  @@@@@.     +@@#-:.:=#@@@+  #@@+:..:+@@#.-=@@#==- 
 %@@@+:.:+@@@%  %@@@@:    =@@-       +@@+ %@%        %@#  @@*    
  ..       :.  +@@@@%     #@%         @@+.@@=        =@@  @@*    
      ::   :+*@@@@@%.     =@@.       -@@: @@#        #@@. @@*    
     %@@@: #@@@@@@+        *@@+.   :*@@=  :@@%-.  .-%@@@. *@@-.. 
     *@@%. *%%#+-           :*%@@@@@%+.     =%@@@@@%=+@@   =%@@@=

"
# Step 1: Create a new directory
mkdir dat
cd dat || exit

# Step 2: Clone a list of repos from Git
repos=(
    "https://github.com/dat-labs/dat-api.git"
    "https://github.com/dat-labs/dat-orchestrator.git"
    "https://github.com/dat-labs/dat-telemetry.git"
    "https://github.com/dat-labs/dat-scheduler.git"
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
if [ "$rebuild" = true ]; then
    docker compose build
fi

# Step 7: Seed local database with verified-actors
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

# Step 7.1: Create a directory named sh-scripts
mkdir sh-scripts

# Step 7.2: Download an sh file via curl and save it in sh-scripts directory
curl -o sh-scripts/actors-seed.sh https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors-seed.sh
curl -o sh-scripts/actors.csv https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors.csv

# Step 7.3: Execute the downloaded file
bash sh-scripts/actors-seed.sh

# Prepare for launch
docker compose down

# Step 7: Run docker compose up
docker compose up