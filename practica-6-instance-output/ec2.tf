resource "aws_instance" "public_instance" {
  ami           = "ami-0fef201115eefe936"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = data.aws_key_pair.my_key.key_name
  tags = {
    "Name" = "Test Instance Public"
  }
  # lifecycle {
  #   create_before_destroy = true
  # }
  # lifecycle {
  #   prevent_destroy = true
  # }
  # lifecycle {
  #   ignore_changes = [
  #     ami,
  #     subnet_id,
  #   ]
  # }
  lifecycle {
    replace_triggered_by = [
      aws_subnet.public_subnet,
    ]
  }
}