#!/bin/bash
set -e

# Stop the running container (if any)

container_id = 'docker ps | awk -F " " '{print $1}''
docker rm -f $container_id
