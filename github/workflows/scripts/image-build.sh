#!/usr/bin/env bash
set -e

PROFILE_NAME=${1:-cloud-demo}

eval $(minikube docker-env -p ${PROFILE_NAME})
docker build -t cloud-demo:local .

echo "Image 'cloud-demo:local' built inside Minikube."