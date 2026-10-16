resource "aws_instance" "public_instance" {
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = var.ec2_specs.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")
  #  user_data              = <<-EOF
  #    #!/bin/bash
  #    sudo dnf update -y
  #    sudo dnf install -y httpd
  #    sudo systemctl start httpd
  #    sudo systemctl enable httpd
  #  EOF
  tags = {
    "Name" = "Test Instance Public"
  }

  provisioner "local-exec" {
    command = "echo Instancia creada con IP ${aws_instance.public_instance.public_ip} >> public_instance_info.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Instancia destruida con IP ${self.public_ip} >> public_instance_info.txt"
  }

}