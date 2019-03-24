#!/usr/bin/env bash
# bootstrap.sh - script to bootstrap this whole environment and get it rolling
#
# Put some instructions on how to use this here, maybe an -h flag that will echo them out.
#
# check if AWS_PROFILE variable is set, and validate this on another host
[ ! -z "$AWS_PROFILE" ] || { echo "AWS_PROFILE is not set"; exit 1; }
[ ! -z "$AWS_REGION" ] || { echo " AWS_REGION is not set"; exit 1; }
# check to make sure aws cli is installed
AWS=`which aws`
[ ! -z "$AWS" ] || { echo "aws cli must be in your $PATH"; exit 1; }

# execute aws cli to apply the tfstate.yaml file
$AWS cloudformation create-stack --region $AWS_REGION --stack-name tfstate \
    --capabilities CAPABILITY_IAM \
    --template-body file://../templates/tfstate.yaml \
    --parameters file://../parameters/tfstate-parameters.json \
    --tags Key=Description,Value=bootstrap.sh

# tell the user the next step
echo "check the status of the stack create operation you just initiated. 
Once that is complete you will be ready to cd ../terraform and begin"