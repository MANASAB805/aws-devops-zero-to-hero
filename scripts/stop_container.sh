#!/bin/bash
set -e

APP_IMAGE="manasab805/simple-python-flask-app"

# Find the running container ID for our app
container_id=$(docker ps -q --filter ancestor="$APP_IMAGE")

if [ -n "$container_id" ]; then
    echo "[STOP] Stopping container: $container_id"
    docker stop "$container_id" || true
    docker rm "$container_id" || true
    echo "[STOP] Container stopped and removed."
else
    echo "[STOP] No running container found for $APP_IMAGE"
fi
