#!/usr/bin/env bash
set -e

PROFILE_NAME=${1:-cloud-demo}

if ! minikube status -p ${PROFILE_NAME} &>/dev/null; then
minikube start -p ${PROFILE_NAME} --driver=docker
fi

kubectl create ns cloud-demo || true

echo "Minikube cluster '${PROFILE_NAME}' ready."