#!/bin/bash

# Read all the rows starting from the second row
tail -n +2 sh-scripts/actors.csv |
while IFS=, read -r name module_name icon actor_type status; # Reading each column
do

    # Check for each row if an actor of the same name exists
    # Creates one if it does not exist
    if response=$(curl -X 'GET' "http://localhost:8000/actors/$actor_type/list" -H 'accept: application/json' -s)
    then
        found_text=$(echo "$response" | grep "$module_name") # Search for module_name in the response
        if [ -n "$found_text" ]
            then echo "$name already exists"
        else
            #Create an actor since it does not exist
            if curl -X 'POST' 'http://localhost:8000/actors' \
                -H 'accept: application/json' -H 'Content-Type: application/json' \
                -d "{
                    \"name\": \"$name\",
                    \"module_name\": \"$module_name\",
                    \"icon\": \"$icon\",
                    \"actor_type\": \"$actor_type\",
                    \"status\": \"$status\"
                }"
            then
                echo "Created an instance of $name"
            else
                echo "Failed to create instance of $name"
            fi
        fi
    else
        echo "API not reachable"
    fi
done