#!/bin/bash

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

# Step 3: Create a directory named db-scripts
mkdir db-scripts

# Step 4: Download an SQL file via curl and save it in db-scripts directory
curl -o db-scripts/001-create-db-seed.sql https://raw.githubusercontent.com/dat-labs/dat-main/main/db-scripts/001-create-db-seed.sql

# Step 5: Download a docker-compose file via curl
curl -O https://raw.githubusercontent.com/dat-labs/dat-main/main/docker-compose.yml

docker pull datlabs/dat-api:latest
docker pull datlabs/dat-orchestrator:latest
docker pull datlabs/dat-telemetry:latest
docker pull datlabs/dat-scheduler:latest
docker pull datlabs/dat-ui:latest

# Step 7: Seed local database with verified-actors
docker compose up db-backend api -d
API_URL="http://localhost:8000/connections/list"

while true; do
    # Use curl to check if the API is reachable
    response=$(curl --write-out "%{http_code}" --silent --output /dev/null "$API_URL")

    # Check if the response code is 200
    if [ "$response" -eq 200 ]; then
        echo "API is reachable. Exiting the loop."
        break
    else
        echo "API is not reachable. Sleeping for 10 second..."
        sleep 10
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

