# main.tf


provider "aws" {
  profile = "default"
  region = "eu-west-2"
  access_key = "XXXXX"
  secret_key = "XXXXX"
}

data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-impish-21.10-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_instance" "app_server" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t3.micro"


}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}
