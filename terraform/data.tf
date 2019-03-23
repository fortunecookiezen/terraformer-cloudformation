data "aws_cloudformation_export" "remote_bucket_name" {
  name = "remoteStateBucketName"
}

data "aws_cloudformation_export" "lock_table_name" {
  name = "locktableName"
}

data "aws_availability_zones" "az" {}

data "aws_cloudformation_export" "vpc" {
  name = "VpcId"
}

data "aws_vpcs" "vpcs" {}

data "aws_vpc" "main" {
  id = "${data.aws_cloudformation_export.vpc.value}"
}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${data.aws_cloudformation_export.vpc.value}"
}

data "aws_subnet" "subnets" {
  count = "${length(data.aws_subnet_ids.subnets.ids)}"
  id    = "${data.aws_subnet_ids.subnets.ids[count.index]}"
}

data "aws_ip_ranges" "amazon_connect" {
  regions  = ["us-west-2", "us-east-1"]
  services = ["AMAZON_CONNECT"]
}
