terraform {
  required_version = ">= 0.14.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.31"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.12.0"
    }
  }
}

provider "aws" {
  region                  = var.context.aws_region
  profile                 = var.context.aws_profile
  shared_credentials_file = var.context.aws_credentials_file
}

provider "postgresql" {
  host      = module.aurora.this_rds_cluster_endpoint
  port      = coalesce(module.aurora.this_rds_cluster_port, 5432)
  database  = "postgres"
  username  = module.aurora.this_rds_cluster_master_username
  password  = module.aurora.this_rds_cluster_master_password
  sslmode   = "require"
  superuser = false
}
