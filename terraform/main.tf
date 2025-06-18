provider "aws" {
  region = var.aws_region
}

resource "tls_private_key" "ec2_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key_pem" {
  content              = tls_private_key.ec2_private_key.private_key_pem
  filename             = "${path.module}/private_key.pem"
  file_permission      = "0600"
  directory_permission = "0700"
}

resource "aws_key_pair" "ec2_private_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_private_key.public_key_openssh
}

resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name

  user_data = file("./user_data.sh") 

  tags = {
    Name = "${var.project_tag}-instance"
  }
}


output "ec2_public_ip" {
  value = aws_instance.web.public_ip
  description = "Public IP of the web server"
}
