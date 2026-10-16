variable "instancias" {
  description = "Name of instances to create"
  type        = list(string)
  default     = ["apache", "mysql", "jumpserver"]
}


resource "aws_instance" "public_instance" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = var.ec2_specs.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")
  tags = {
    "Name" = each.value
  }
}

#variable "cadena" {
#  type        = string
#  description = "A string variable"
#  default     = "ami-123,AMI-AAV,ami-12f"
#}

#variable "palabras" {
#  type        = list(string)
#  default     = ["hola", "como", "estan", "?"]
#}

#variable "entornos" {
#  type        = map(string)
#  default     = {
#    dev  = "10.10.0.0/16"
#    prod = "172.16.0.0/16"
#    qa   = "10.10.2.0/24"
#  }
#}