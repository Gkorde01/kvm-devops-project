terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "devops_vm" {
  ami           = "ami-0f5ee92e2d63afc18" # Ubuntu (Mumbai region example)
  instance_type = "t2.micro"

  tags = {
    Name = "devops-vm"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF
}
