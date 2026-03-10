#!/bin/bash
set -e

CLUSTER_NAME="staging-demo"
REGION="us-east-1"

echo "Terraform apply..."
cd ../terraform
terraform init
terraform apply -auto-approve
cd ..

echo "Update kubeconfig..."
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME

echo "Apply Argo apps..."
kubectl apply -f kubernetes/
kubectl apply -f kubernetes/argocd/
kubectl apply -f kubernetes/argocd/monitoring


echo "Done"