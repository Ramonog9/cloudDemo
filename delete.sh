#!/usr/bin/env bash
set -e


kubectl delete -n cloud-demo -f k8s/service.yaml || true
kubectl delete -n cloud-demo -f k8s/deployment.yaml || true
kubectl delete -f k8s/namespace.yaml || true


echo "Resources deleted from namespace 'cloud-demo'."