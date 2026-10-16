terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.36.0, <6.52.0, !=6.43.0"
    }
  }
  required_version = "~>1.15"
}

provider "aws" {
  region = "us-east-1"
}