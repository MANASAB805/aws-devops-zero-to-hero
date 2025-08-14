#!/bin/bash
set -e

APP_IMAGE="manasab805/simple-python-flask-app"
APP_PORT=5000

echo "[START] Pulling latest Docker image: $APP_IMAGE"
docker pull "$APP_IMAGE"

# Stop any running container of the same image
container_id=$(docker ps -q --filter ancestor="$APP_IMAGE")
if [ -n "$container_id" ]; then
    echo "[START] Stopping existing container: $container_id"
    docker stop "$container_id" || true
    docker rm "$container_id" || true
fi

# Start the container
echo "[START] Running container on port $APP_PORT"
docker run -d -p $APP_PORT:$APP_PORT --restart always "$APP_IMAGE"

echo "[START] Container started successfully!"
docker ps --filter ancestor="$APP_IMAGE"

