#!/bin/bash

# Function to open a new tab and execute a command
function open_tab() {
  osascript -e "tell application \"Terminal\" to do script \"cd $1; $2\""
}

# Get the current directory
current_dir=$(pwd)

# Start the Student Backend portal
open_tab "$current_dir/backend/student" "docker-compose up db -d && ./mvnw clean package && docker-compose up api"

# Start the Finance backend portal
open_tab "$current_dir/backend/finance" "docker-compose up"
