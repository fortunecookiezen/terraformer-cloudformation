# terraformer-cloudformation

Repo for terraform-cloudformation orchestrator

Probably a whackjob idea, but using terraform to orchestrate things in a multiple account environment. Inspired by conversations with @peterb154

* start-here/tfstate.yaml - cloudformation to create terraform state s3 bucket and dynamodb lock table
* start-here/terraform.tf - remote state definition
* templates/ - cloudformation templates
