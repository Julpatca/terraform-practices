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