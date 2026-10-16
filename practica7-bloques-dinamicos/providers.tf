terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.9.1"
    }
  }
  required_version = "~>1.15"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}