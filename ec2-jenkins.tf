terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.70.0,<=3.73.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/var/lib/jenkins/.aws/credentials"
  profile = "default"

}


resource "aws_instance" "my-first-ec2" {
  ami           = "ami-0359b3157f016ae46"
  instance_type = "t3.micro"
  tags = {
    Name  = "myec2-1"
    Owner = "Paulo"
  }
}
