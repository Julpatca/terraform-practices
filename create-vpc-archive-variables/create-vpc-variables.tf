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