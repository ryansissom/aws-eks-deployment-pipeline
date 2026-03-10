echo "Delete ArgoCD apps..."
kubectl delete applications --all -n argocd --ignore-not-found --cascade=foreground

kubectl delete ingress my-app -n my-app-ns

echo "All ArgoCD applications deleted!"

echo "Destroy terraform..."
terraform -chdir=../terraform destroy --auto-approve
echo "Terraform destroyed!"