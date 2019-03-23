provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "fcz-dev-us-east-1-tfstate"
    dynamodb_table = "fcz-dev-us-east-1-terraformlocktable"
    region         = "us-east-1"
    key            = "terraform/terraform.tfstate"
  }
}
