resource "aws_vpc" "vpc-virginia" {
  cidr_block = var.virginia_vpc_cidr
  tags = {
    "Name" = "VPC Virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc-virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Public Subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc-virginia.id
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "Private Subnet-${local.sufix}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc-virginia.id

  tags = {
    Name = "IGW VPC Virginia-${local.sufix}"
  }
}

resource "aws_route_table" "public-CRT" {
  vpc_id = aws_vpc.vpc-virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "Public Custom RT-${local.sufix}"
  }
}

resource "aws_route_table_association" "CRT-association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public-CRT.id
}


resource "aws_security_group" "sg_public_instance" {
  name        = "SG for Public Instanece"
  description = "Allow SSH & HTTP inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-virginia.id
  tags = {
    Name = "allow_ssh"
  }

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = "Allow inbound traffic on port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.SG_ingress_CIDR]
    }
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # semantically equivalent to all ports
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "mybucket" {
  source    = "./modulo/s3"
  my_bucket = "my-terraform-bucket-${local.sufix}"
}
#  ingress {
#    description = "Allow SSH inbound traffic"
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = [var.SG_ingress_CIDR]
#  }
#
#  ingress {
#    description = "Allow HTTP inbound traffic"
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = [var.SG_ingress_CIDR]
#  }
#
#  ingress {
#    description = "Allow HTTPS inbound traffic"
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = [var.SG_ingress_CIDR]
#  }
#
#  egress {
#    description = "Allow all outbound traffic"
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1" # semantically equivalent to all ports
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
#  security_group_id = aws_security_group.sg_public_instance.id
#  cidr_ipv4         = var.SG_ingress_CIDR
#  description       = "Allow SSH Ingress traffic"
#  from_port         = 22
#  ip_protocol       = "tcp"
#  to_port           = 22
#}

#resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#  security_group_id = aws_security_group.sg_public_instance.id
#  cidr_ipv4         = "0.0.0.0/0"
#  ip_protocol       = "-1" # semantically equivalent to all ports
#  description       = "Allow all egress traffic"
#}


# You cannot create a new backend by simply defining this and then
# immediately proceeding to "terraform apply". The S3 backend must
# be bootstrapped according to the simple yet essential procedure in
# https://github.com/cloudposse/terraform-aws-tfstate-backend#usage

# module "terraform_state_backend" {
#   source = "cloudposse/tfstate-backend/aws"
#   # Cloud Posse recommends pinning every module to a specific version
#   version     = "1.9.0"
#   namespace  = "exampledcnifcmzkl"
#   stage      = "prd"
#   name       = "terraform"
#   environment = "us-east-1"
#   attributes = ["state"]
#
#   terraform_backend_config_file_path = "."
#   terraform_backend_config_file_name = "backend.tf"
#   force_destroy                      = false
# }
