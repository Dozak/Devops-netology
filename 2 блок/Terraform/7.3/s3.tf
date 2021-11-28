provider "aws" {
        region = "eu-west-2"
        access_key = "AKIAUTHSPKHHO7QTJ6GG"
        secret_key = "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"
}

locals {
  web_instance_count_map = {
  stage = 1
  prod = 2
  }
}

resource "aws_s3_instance" "bucket" {
  bucket = "netdev-bucket-${count.index}-${terraform.workspace}"
  acl    = "private"
  tags = {
    Name        = "Bucket ${count.index}"
    Environment = terraform.workspace
  }
  count = local.web_instance_count_map[terraform.workspace]
}

locals {
  backets_ids = toset([
    "e1",
    "e2",
  ])
}
resource "aws_s3_instance" "bucket_e" {
  for_each = local.backets_ids
  bucket = "netdev-bucket-${each.key}-${terraform.workspace}"
  acl    = "private"
  tags = {
    Name        = "Bucket ${each.key}"
    Environment = terraform.workspace
  }
}
