#!/bin/bash

# Exit the script if any command fails
set -e

# Directory containing the docker-compose.yml file
COMPOSE_DIR="docker-compose"

# Check if any argument is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 {up|down|build|logs|restart|start}"
  exit 1
fi

# Profile
PROFILE=$2
# Command execution
COMMAND=$1

cd "$COMPOSE_DIR/$PROFILE" || { echo "Directory $COMPOSE_DIR/$PROFILE not found."; exit 1; }


case $COMMAND in
  up)
    echo "Starting Docker Compose services..."
    docker-compose up -d  # Start services in detached mode
    ;;
  down)
    echo "Stopping Docker Compose services..."
    docker-compose down  # Stop and remove services
    ;;
  build)
    echo "Building Docker Compose images..."
    docker-compose build  # Build or rebuild the services
    ;;
  logs)
    echo "Fetching Docker Compose logs..."
    docker-compose logs -f  # Follow the logs of running services
    ;;
  restart)
    echo "Restarting Docker Compose services..."
    docker-compose restart  # Restart all services
    ;;
  start)
    echo "Restarting Docker Compose services..."
    docker-compose restart  # Restart all services
    ;;
  *)
    echo "Unknown command: $COMMAND"
    echo "Usage: $0 {up|down|build|logs|restart}"
    exit 1
    ;;
esac
