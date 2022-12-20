terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-3"
}

module "s3_buckets" {
  for_each = toset(var.buckets)

  source = "terraform-aws-modules/s3-bucket/aws"

  bucket_prefix = format("%s-", each.key)
  acl    = "private"

  versioning = {
    enabled = true
  }

}