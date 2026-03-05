# AWS EKS DevOps Platform
### Terraform • ArgoCD • Kubernetes Observability
## About
This repository contains a **cloud-native DevOps platform built on AWS EKS** designed to demonstrate modern DevOps and platform engineering practices.

Infrastructure is provisioned using **Terraform**, which deploys the full AWS environment including **VPC networking, IAM roles, subnets, and the EKS cluster itself**. Once the cluster is created, applications and platform services are deployed using Kubernetes and ArgoCD GitOps workflows.

The cluster also includes a full observability stack using **Prometheus, Grafana, and Loki** to provide monitoring, metrics, and centralized logging for both the cluster and deployed workloads.

This project is inspired by the **roadmap.sh DevOps roadmap** and is structured to demonstrate the major domains of DevOps engineering. Each section of the repository includes its own README explaining the concepts, design decisions, and implementation details.

The long-term goal of this project is to evolve it into a larger **DevOps and DevSecOps showcase**, highlighting practical skills in infrastructure automation, Kubernetes orchestration, CI/CD pipelines, and cloud security.

## Infrastructure
(Infrastructure Diagram)

## Tech Stack
- AWS EKS
- Terraform
- Docker
- ArgoCD
- GitHub Actions
- Prometheus / Grafana / Loki
- FastAPI

## Repository Structure
- terraform/      Infrastructure provisioning  
- kubernetes/     Kubernetes manifests and configs  
  - argocd/         ArgoCD applications  
- app/            FastAPI service  
- scripts/        Deployment utilities


## Application
The FastAPI application is packaged as a Docker image and published through the CI pipeline.

## Containerization
The FastAPI service is containerized with Docker to ensure consistent builds and portable deployment.

## CI/CD
GitHub Actions performs linting, builds the container image, runs tests, and pushes artifacts to the registry.

## Infrastructure as Code
Terraform provisioning of AWS + EKS

## GitOps Deployment
ArgoCD manages Kubernetes manifests using a GitOps deployment model.

## Observability
Cluster metrics, logs, and system health are collected with Prometheus, Grafana, and Loki. (Image of dashboards?)

## Security
Container images are scanned with Trivy to identify vulnerabilities before deployment