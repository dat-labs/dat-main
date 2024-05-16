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

# Step 5: Download a docker-compose file via curl
# curl -o docker-compose.yml https://raw.githubusercontent.com/dat-labs/dat-main/main/docker-compose-dev.yml
cp ../docker-compose-dev.yml docker-compose.yml

# Step 6: Run docker compose build
if [ "$rebuild" = true ]; then
    docker compose build
fi

docker compose up db-backend api -d
sleep 5
cd ../ || exit
 python cli/main.py add-to-db --actor-type="source" --actor-name="GoogleDrive" --module-name="google_drive"
 python cli/main.py add-to-db --actor-type="source" --actor-name="WebsiteCrawler" --module-name="website_crawler"
 python cli/main.py add-to-db --actor-type="generator" --actor-name="OpenAI" --module-name="openai"
 python cli/main.py add-to-db --actor-type="generator" --actor-name="SentenceTransformers" --module-name="sentencetransformers"
 python cli/main.py add-to-db --actor-type="destination" --actor-name="Pinecone" --module-name="pinecone"

cd dat-dev || exit
docker compose down

# Step 7: Run docker compose up
docker compose up