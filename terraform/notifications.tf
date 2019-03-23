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
