#!/bin/bash
set -e

# Pull the latest image
docker pull manasab805/simple-python-flask-app

# Run the container in detached mode
docker run -d -p 5000:5000 --restart always manasab805/simple-python-flask-app
