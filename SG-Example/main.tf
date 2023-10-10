provider "aws" {
    region = "us-east-1"
    access_key = "***************"
    secret_key = "***************"
}


resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}









resource "aws_security_group" "this" {
  name        = "my-tf-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0","122.168.89.207/32"]
    security_groups = ["sg-01045dc2faf334779"]
    
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["122.168.89.207/32"]
    security_groups = ["sg-01045dc2faf334779"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Mera_VPC"
  }
}
