########################################
# Terraform Configuration
########################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 3.0.0"
    }
  }
}

########################################
# Provider
########################################

provider "aws" {
  region = local.region
}



########################################
# Resources
########################################

resource "aws_ecr_repository" "my_app_repo" {
  name                 = "my-app"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
