#!/bin/bash
set -e

# Find the running container ID for our app (if any)
container_id=$(docker ps -q --filter ancestor=manasab805/simple-python-flask-app)

# Stop and remove the container if it exists
if [ -n "$container_id" ]; then
    docker rm -f "$container_id"
fi
