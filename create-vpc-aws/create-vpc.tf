resource "aws_vpc" "vpc-virginia" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name        = "vpc-virginia"
    name        = "prueba"
    Environment = "dev"
  }
}