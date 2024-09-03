@echo off
REM Display ASCII art
echo  "     +@@#. +#*+-                      %@-                 #%=    
     @@@@- #@@@@@#:                  .@@+                 @@*    
      --.  -#@@@@@@*                 .@@+                 @@*    
              :#@@@@*       .+#@@@%#=.@@+   :+#@@@@#+: .**@@%**+ 
 #@@%-. .=%@@*  @@@@@.     +@@#-:.:=#@@@+  #@@+:..:+@@#.-=@@#==- 
 %@@@+:.:+@@@%  %@@@@:    =@@-       +@@+ %@%        %@#  @@*    
  ..       :.  +@@@@%     #@%         @@+.@@=        =@@  @@*    
      ::   :+*@@@@@%.     =@@.       -@@: @@#        #@@. @@*    
     %@@@: #@@@@@@+        *@@+.   :*@@=  :@@%-.  .-%@@@. *@@-.. 
     *@@%. *%%#+-           :*%@@@@@%+.     =%@@@@@%=+@@   =%@@@="
     
REM Step 1: Create a new directory
mkdir dat
cd dat || exit /b

REM Step 3: Create a directory named db-scripts
mkdir db-scripts

REM Step 4: Download an SQL file via curl and save it in db-scripts directory
curl -o db-scripts/001-create-db-seed.sql https://raw.githubusercontent.com/dat-labs/dat-main/main/db-scripts/001-create-db-seed.sql

REM Step 5: Download a docker-compose file via curl
curl -O https://raw.githubusercontent.com/dat-labs/dat-main/main/docker-compose.yml

REM docker compose down just to be safe
docker compose down

REM Pull docker images
docker pull datlabs/dat-api:latest
docker pull datlabs/dat-orchestrator:latest
docker pull datlabs/dat-telemetry:latest
docker pull datlabs/dat-scheduler:latest
docker pull datlabs/dat-ui:latest

REM Step 7: Seed local database with verified-actors
docker compose up db-backend api -d
set API_URL=http://localhost:8000/connections/list

:CHECK_API
REM Use curl to check if the API is reachable
curl --write-out "%%{http_code}" --silent --output NUL %API_URL?workspace_id=wkspc-uuid% | findstr /c:"200" > NUL
if %ERRORLEVEL% == 0 (
    echo API is reachable. Exiting the loop.
    goto :CONTINUE
) else (
    echo API is not reachable. Sleeping for 10 second...
    timeout /t 10
    goto :CHECK_API
)

:CONTINUE
REM Step 7.1: Create a directory named sh-scripts
mkdir sh-scripts

REM Step 7.2: Download a sh file via curl and save it in sh-scripts directory
curl -o sh-scripts/actors-seed.bat https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors-seed.bat
curl -o sh-scripts/actors.csv https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors.csv

REM Step 7.3: Execute the downloaded file
call .\sh-scripts/actors-seed.bat

REM Prepare for launch
docker compose down

REM Step 7: Run docker compose up
docker compose up
