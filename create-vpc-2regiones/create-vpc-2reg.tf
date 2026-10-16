resource "aws_vpc" "vpc-virginia" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name        = "vpc-virginia"
    name        = "prueba"
    Environment = "dev"
  }
}

resource "aws_vpc" "vpc-ohio" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Name        = "vpc-ohio"
    name        = "prueba"
    Environment = "dev"
  }
  provider = aws.ohio
}