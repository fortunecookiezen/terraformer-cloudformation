# terraformer-cloudformation

Repo for terraform-cloudformation orchestrator

Probably a whackjob idea, but using terraform to orchestrate things in a multiple account environment. Inspired by conversations with @peterb154

## The Big Idea

Use [terraform](https://terraform.io) to perform complex orchestration and processing across multiple [aws](https://aws.amazon.com) accounts. Terraform has the ability to import values from CloudFormation, and the ability to invoke additional provisioners (including local and remote-exec) as needed. Which gets me thinking about all sorts of possibilities...

Possibilities like starting with nothing other than some aws account credentials and a repo to spin up an entire multiple account transit vpc architecture using a transit gateway, and doing it all with a single script.

But seriously, as a recovering Enterprise Architect, this is a significant anti-pattern: the use of multiple paradigms to manage similar resources with no clear domain boundaries.  *JUST SAY NO TO THIS SHIT*

## Contents

* start-here/bootstrap.sh - bootstrap script with instructions
* start-here/tfstate.yaml - cloudformation to create terraform state s3 bucket and dynamodb lock table
* templates/cloudformationNotifications.yaml (creates notification arns)
* terraform/data.tf (examples of importing existing environment data)
* terraform/notifications.tf (applies the cloudformationNotifications.yaml template)
* terraform/main.tf
* terraform/modules
* terraform/output.tf
* terraform/securitygroup.tf (creates a security group using the aws_ipranges_json data source)
* terraform/variables.tf
* terraform/terraform.tfvars.example

Seriously, I can think of a million things wrong with this idea:

* It needs a compute resource to execute it: ec2 or Cloud 9 or *god forbid* a developer's laptop.
that makes this inherently insecure. Gain access to that resource, and you own *all* the accounts.

## To DO

* Create an example of exporting and importing data from a local exec or something like that
* Create an example of running something locally inside the execution environment
* Create a bootstrap script that will setup the initial environment
