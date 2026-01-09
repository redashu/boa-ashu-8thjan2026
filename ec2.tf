terraform {
  required_version = "~> 1.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  ami           = "dnd-0abcdef1234567890"
  instance_type = "t2.micro"

  availability_zone = "us-east-1a"

  tags = {
    name = "mynewinstance"
  }
}