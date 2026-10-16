variable "virginia_vpc_cidr" {
  description = "CIDR Virginia"
  type        = string
  #### NO SE VEAN DATOS SENSIBLES ####
  # sensitive   = true
  #################################
}

#### VARIABLES DE SUBNETS ####
#variable "public_subnet" {
#  description = "CIDR Public Subnet"
#  type        = string
#}

#variable "private_subnet" {
#  description = "CIDR Private Subnet"
#  type        = string
#}
##############################

variable "subnets" {
  description = "List of subnet CIDRs"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}