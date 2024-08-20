@echo off
setlocal enabledelayedexpansion

REM Create a directory named sh-scripts
if not exist sh-scripts (
    mkdir sh-scripts
)

REM Download the actors.csv file
curl -o sh-scripts\actors.csv https://raw.githubusercontent.com/dat-labs/dat-main/main/sh-scripts/actors.csv

REM Read all the rows starting from the second row
for /f "skip=1 tokens=1-5 delims=," %%a in (sh-scripts\actors.csv) do (
    set "name=%%a"
    set "module_name=%%b"
    set "icon=%%c"
    set "actor_type=%%d"
    set "status=%%e"

    REM Check for each row if an actor of the same name exists
    REM Creates one if it does not exist
    for /f %%r in ('curl -X "GET" "http://localhost:8000/actors/!actor_type!/list" -H "accept: application/json" -s') do (
        echo %%r | findstr "!module_name!" >nul
        if !errorlevel! == 0 (
            echo !name! already exists
        ) else (
            curl -X "POST" "http://localhost:8000/actors" -H "accept: application/json" -H "Content-Type: application/json" -d "{\"name\": \"!name!\", \"module_name\": \"!module_name!\", \"icon\": \"!icon!\", \"actor_type\": \"!actor_type!\", \"status\": \"!status!\"}"
            if !errorlevel! == 0 (
                echo Created an instance of !name!
            ) else (
                echo Failed to create instance of !name!
            )
        )
    )
)

endlocal
