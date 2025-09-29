#!/usr/bin/env bash

set -e
kubectl apply -f k8s/namespace.yaml
kubectl apply -n cloud-demo -f k8s/deployment.yaml
kubectl apply -n cloud-demo -f k8s/service.yaml