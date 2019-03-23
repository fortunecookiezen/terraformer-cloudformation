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

resource "aws_cloudformation_stack" "tf-notifications" {
  name = "tf-notifications"

  parameters = {
    ASI         = "fcz"
    Environment = "dev"
    Owner       = "phillips.james@gmail.com"
  }

  capabilities  = ["CAPABILITY_IAM"]
  template_body = "${file("../templates/cloudformationNotifications.yaml")}"

  tags {
    Description = "Managed by Terraform"
  }
}

resource "aws_security_group" "amazon_connect_sg" {
  vpc_id = "${data.aws_vpc.main.id}"
  name   = "amazon_connect"

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_ip_ranges.amazon_connect.cidr_blocks}"]
  }

  tags {
    Name        = "amazon_connect_sg"
    Description = "Managed by Terraform"
    CreateDate  = "${data.aws_ip_ranges.amazon_connect.create_date}"
    SyncToken   = "${data.aws_ip_ranges.amazon_connect.sync_token}"
  }
}
