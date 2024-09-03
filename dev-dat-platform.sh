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

# ./ctOS-boot/ctOS_boot.sh

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
mkdir dat-dev
cd dat-dev || exit

# Step 2: Clone a list of repos from Git
repos=(
    "git@github.com:dat-labs/dat-api.git"
    "git@github.com:dat-labs/dat-orchestrator.git"
    "git@github.com:dat-labs/dat-telemetry.git"
    "git@github.com:dat-labs/dat-api-sdk.git"
    "git@github.com:dat-labs/dat-scheduler.git"
    "git@github.com:dat-labs/dat-ui.git"
    "git@github.com:dat-labs/dat-core.git"
    "git@github.com:dat-labs/verified-sources.git"
    "git@github.com:dat-labs/verified-generators.git"
    "git@github.com:dat-labs/verified-destinations.git"
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
cp ../db-scripts/001-create-db-seed.sql db-scripts/

cp ../docker-compose-dev.yml docker-compose.yml

# docker compose down just to be safe
docker compose down

# Step 6: Run docker compose build
if [ "$rebuild" = true ]; then
    docker compose build
fi

docker compose up db-backend api -d
API_URL="http://localhost:8000/connections/list"

while true; do
    # Use curl to check if the API is reachable
    response=$(curl --write-out "%{http_code}" --silent --output /dev/null "$API_URL?workspace_id=wkspc-uuid")

    # Check if the response code is 200
    if [ "$response" -eq 200 ]; then
        echo "API is reachable. Exiting the loop."
        break
    else
        echo "API is not reachable. Sleeping for 10 seconds..."
        sleep 10
    fi
done


sh ../sh-scripts/actors-seed.sh

docker compose down

# Step 7: Run docker compose up
docker compose up