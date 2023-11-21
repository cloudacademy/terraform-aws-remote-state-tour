terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
  # Remote State

}
provider "aws" {
  region = "us-west-2"
}

# Resources

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.az
  tags = {
    Name = "${var.server_name}-subnet"
  }
}
resource "aws_instance" "server" {
  ami                    = lookup(var.ami_ids, var.os_type, null)
  instance_type          = var.instance_type
  monitoring             = var.ec2_monitoring
  vpc_security_group_ids = [aws_vpc.example.default_security_group_id]
  subnet_id              = aws_subnet.example.id
  root_block_device {
    delete_on_termination = var.disk.delete_on_termination
    encrypted             = var.disk.encrypted
    volume_size           = var.disk.volume_size
    volume_type           = var.disk.volume_type
  }
  tags = {
    Name = var.server_name
  }
}