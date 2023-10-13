//resource "aws_vpc" "vpc-1" {
//  cidr_block = var.cidr[0]
//  tags = var.tags
//}

#resource "aws_subnet" "pub-sub-1" {
#    cidr_block = var.cidr[1]
#    vpc_id = aws_vpc.vpc-1.id
#    availability_zone = "us-east-1a"
#    map_public_ip_on_launch = var.public_ip
#
#    tags = {
#        Name = "pub-1"
#    }
#}
#
#
#resource "aws_subnet" "pub-sub-2" {
#    cidr_block = var.cidr[2]
#    vpc_id = aws_vpc.vpc-1.id
#    availability_zone = "us-east-1b"
#    map_public_ip_on_launch = true
#
#    tags = {
#        Name = "Pub-2"
#    }
#}
#
#
#resource "aws_subnet" "pri-sub-1" {
#    cidr_block = var.cidr[3]
#    vpc_id = aws_vpc.vpc-1.id
#    availability_zone = "us-east-1a"
#    tags = {
#        Name = "pri-1"
#    }
#}


#resource "aws_subnet" "pri-sub-2" {
#    cidr_block = var.cidr[4]
#    vpc_id = aws_vpc.vpc-1.id
#    availability_zone = "us-east-1b"
#    tags = {
#        Name = "pri-2"
#    }
#}

#resource "aws_s3_bucket" "s3-tf" {
#  bucket = "remote-stacte"
#
#  tags = {
#    Name        = "Terraform-state-file"
#  }
#}
#
#resource "aws_s3_bucket_versioning" "s3-version" {
#  bucket = aws_s3_bucket.s3-tf.id
#  versioning_configuration {
#    status = "Enabled"
#  }
#}

data "aws_ami" "ub" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


# Availability Zones Datasource
data "aws_availability_zones" "xyz" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


resource "aws_instance" "shiv" {
  ami           = data.aws_ami.ub.id
  #instance_type = "t2.micro"
  instance_type = var.instance_type_list[0]
  #instance_type = var.instance_type_map["stuti"]
  #count = 5
  for_each = toset (data.aws_availability_zones.xyz.names)
  availability_zone = each.key


  tags = {

    Name = "Terraform-instance-${each.key}"
  }
}



//resource "aws_instance" "my-tf" {
//    ami = data.aws_ami.ub.id
//    instance_type = var.instance_type_list[0]
//    
//}



//resource "tls_private_key" "my-key" {
//  algorithm = "RSA"
//  rsa_bits  = 4096
//}
//
//
//data "tls_public_key" "private_key_pem-example" {
//  private_key_pem = tls_private_key.my-key.private_key_pem
//}


