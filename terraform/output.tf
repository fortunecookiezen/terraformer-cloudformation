output "vpc_ids" {
  value = "${data.aws_vpcs.vpcs.ids}"
}

output "vpc_0" {
  value = "${data.aws_vpcs.vpcs.0.ids}"
}

output "vpc_cidr_block" {
  value = ["${data.aws_vpc.main.cidr_block}"]
}

output "subnet_cidr_blocks" {
  value = ["${data.aws_subnet.subnets.*.cidr_block}"]
}
