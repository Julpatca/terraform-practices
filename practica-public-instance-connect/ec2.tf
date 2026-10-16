resource "aws_instance" "public_instance" {
  ami                    = "ami-0fef201115eefe936"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo dnf update -y
    sudo dnf install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
  EOF

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
  #lifecycle {
  #   replace_triggered_by = [
  #     aws_subnet.public_subnet,
  #   ]
  #}

  provisioner "local-exec" {
    command = "echo Instancia creada con IP ${aws_instance.public_instance.public_ip} >> public_instance_info.txt"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Instancia destruida con IP ${self.public_ip} >> public_instance_info.txt"
  }

  #provisioner "remote-exec" {
  #  inline = [
  #    "echo 'Hello, World!' > ~/saludo.txt"
  #    ]

  #  connection {
  #    type        = "ssh"
  #    host        = self.public_ip
  #    user        = "ec2-user"
  #    private_key = file("~/masterkey.pem")
  #  }
  #}

  #provisioner "remote-exec" {
  #    inline = [
  #      "sudo dnf update -y",
  #      "sudo dnf install -y httpd",
  #      "sudo systemctl start httpd",
  #      "sudo systemctl enable httpd"
  #    ]
  #
  #  connection {
  #    type        = "ssh"
  #    host        = self.public_ip
  #    user        = "ec2-user"
  #    private_key = file("~/masterkey.pem")
  #  }
  #}

  # UBUNTU
  #provisioner "remote-exec" {
  #    inline = [
  #      "sudo apt-get update -y",
  #      "sudo apt-get install -y apache2",
  #      "sudo systemctl start apache2",
  #      "sudo systemctl enable apache2"
  #    ]

  #  connection {
  #    type        = "ssh"
  #    host        = self.public_ip
  #    user        = "ec2-user"
  #    private_key = file("~/masterkey.pem")
  #  }
  #}

}