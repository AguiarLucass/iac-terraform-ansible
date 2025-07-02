terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region = "us-west-2"
}

  resource "aws_instance" "app_server" {
  ami           = "ami-05f991c49d264708f"
  instance_type = "t2.micro"
  key_name = "iac-git"

  tags = {
    Name = "learn-terraform and ansible"
  }
}

