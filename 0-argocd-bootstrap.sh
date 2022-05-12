#!/bin/bash

kubectl config use-context do-ams3-k8s-1-22-8-do-1-ams3-1652038503552

# Creating namespace, deploying ArgoCD and ingress
kubectl create namespace argocd
kubectl apply -n argocd -f cluster-bootstrap/raw-manifests/argocd-install.yaml
kubectl apply -f cluster-bootstrap/nginx-ingressclass.yaml
kubectl apply -f cluster-bootstrap/raw-manifests/argocd-ingress.yaml

sleep 90
# Get ArgoCD admin password
echo "### ArgoCD password: $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)"
