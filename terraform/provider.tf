terraform {
  required_version = ">=1.5.0"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "local-subs"
    key = "eks/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project = "Jerney"
      Environment = var.environment
      Managedby = "Terraform"
    }
  }
}