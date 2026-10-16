resource "aws_vpc" "vpc-virginia" {
  cidr_block = var.virginia_vpc_cidr
  ### DEFINIR TAGS ####
  # tags = {
  # Name = "VPC_Virginia"
  # name = "Prueba"
  # environment = "dev"
  #####################
  #### COMENTAR PARA USAR VARIABLES DE TAGS DESDE PROVIDERS.TF ####
  #  tags = var.tags
  #####################
  tags = {
    "Name" = "VPC Virginia"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc-virginia.id
  #### VARIABLES DE SUBNETS ####
  #cidr_block        = var.public_subnet
  ##############################
  cidr_block = var.subnets[0]
  #### DEFINIR TAGS ####
  # tags = {
  # Name = "Public Subnet"
  # name = "Prueba"
  # environment = "dev"
  #####################
  map_public_ip_on_launch = true

  #### COMENTAR PARA USAR VARIABLES DE TAGS DESDE PROVIDERS.TF PARA AGREGAR NOMBRE A CADA SUBNET ####
  #  tags = var.tags
  #######################
  tags = {
    "Name" = "Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc-virginia.id
  #### VARIABLES DE SUBNETS ####
  #cidr_block        = var.private_subnet
  ##############################
  cidr_block = var.subnets[1]
  ### DEFINIR TAGS ####
  # tags = {
  # Name = "Private Subnet"
  # name = "Prueba"
  # environment = "dev"
  #####################
  #### COMENTAR PARA USAR VARIABLES DE TAGS DESDE PROVIDERS.TF PARA AGREGAR NOMBRE A CADA SUBNET ####
  #  tags = var.tags
  #######################
  tags = {
    "Name" = "Private Subnet"
  }
}