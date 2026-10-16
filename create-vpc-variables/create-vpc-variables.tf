resource "aws_vpc" "vpc-virginia" {
  cidr_block = var.virginia_vpc_cidr
  tags = {
    Name        = "vpc-virginia"
    name        = "prueba"
    Environment = "dev"
  }
}

resource "aws_vpc" "vpc-ohio" {
  cidr_block = var.ohio_vpc_cidr
  tags = {
    Name        = "vpc-ohio"
    name        = "prueba"
    Environment = "dev"
  }
  provider = aws.ohio
}

variable "virginia_vpc_cidr" {
  description = "The CIDR block for the VPC on Virginia region"
  type        = string
  default     = "10.10.0.0/16"
}

variable "ohio_vpc_cidr" {
  description = "The CIDR block for the VPC on Ohio region"
  type        = string
  default     = "10.20.0.0/16"
}