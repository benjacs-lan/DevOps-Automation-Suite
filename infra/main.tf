# Infraestructura mínima: despliega una instancia EC2 con Docker en AWS

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  default = "us-east-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0c94855ba95c71c99" # Ubuntu Server 18.04 LTS (actualiza según región)
  instance_type = "t2.micro"

  tags = {
    Name = "DevOps-Docker-Instance"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io
    systemctl start docker
    docker run -d --name devops_nginx -p 80:80 nginx:latest
  EOF
}

output "instance_ip" {
  value = aws_instance.devops_server.public_ip
}
