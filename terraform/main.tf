########################################
# Terraform Configuration
########################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

########################################
# Provider
########################################

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Terraform   = true
      Environment = var.env
    }
  }
}

########################################
# Data Sources
########################################

data "aws_availability_zones" "available" {}

########################################
# Modules
########################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-main"
  cidr = "10.0.0.0/16"

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets


  # Settings
  map_public_ip_on_launch = true # Allows resources to automatically get IP
  enable_nat_gateway      = true
  single_nat_gateway      = true # Cheaper, but not highly available architecture
  enable_vpn_gateway      = false

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1" # Required to allow EKS to discover public load balancers
    # shared?
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1" # Required to allow EKS to discover internal load balancers
    # shared?
  }

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
