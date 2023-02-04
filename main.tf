terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "datalake-xpe-bg"
    key = "terraform/state/edc/mod1/terraform.tfstate"
    region = "us-east-2"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}
variable "aws_region" {
  default = "us-east-2"
}
resource "aws_iam_role" "lambda_emr" {
  name = "DESM1LambdaRole"
  assume_role_policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": "AssumeRole"
        }
      ]
    })
}
