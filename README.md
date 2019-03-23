# terraformer-cloudformation

Repo for terraform-cloudformation orchestrator

Probably a whackjob idea, but using terraform to orchestrate things in a multiple account environment. Inspired by conversations with @peterb154

## The Big Idea

Use [terraform]:(<http://terraform.io>) to perform complex orchestration and processing across multiple accounts.

Seriously, as a recovering Enterprise Architect, this is a significant anti-pattern: the use of multiple paradigms to manage similar resources with no clear domain boundaries.  *JUST SAY NO TO THIS SHIT*

* start-here/tfstate.yaml - cloudformation to create terraform state s3 bucket and dynamodb lock table
* templates/ - cloudformation templates
* terraform/data.tf (examples of importing existing environment data)
* terraform/main.tf (creates a security group)
* terraform/modules
* terraform/outputs.tf 
* terraform/variables.tf

Seriously, I can think of a million things wrong with this idea:

* It needs a compute resource to execute it: ec2 or Cloud 9 or *god forbid* a developer's laptop.
that makes this inherently insecure. Gain access to that resource, and you own *all* the accounts.

