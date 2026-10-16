variable "virginia_vpc_cidr" {
  description = "CIDR Virginia"
  type        = string
}

variable "subnets" {
  description = "List of subnet CIDRs"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "SG_ingress_CIDR" {
  description = "CIDR for SG Ingress"
  type        = string
}

variable "ec2_specs" {
  description = "Specifications for the EC2 instance"
  type        = map(string)
}

variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type        = list(number)
}