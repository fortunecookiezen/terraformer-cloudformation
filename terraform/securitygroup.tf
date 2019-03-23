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
