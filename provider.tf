# Define the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "http" {} 
}

# Configured and downloading plugins for aws
provider "aws" {
  region     = "${var.aws_region}"
}