resource "aws_vpc" "vpc-virginia" {
  cidr_block = var.virginia_vpc_cidr
  tags = {
    "Name" = "VPC Virginia"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc-virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc-virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "Private Subnet"
  }
}