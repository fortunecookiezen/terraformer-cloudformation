# start-here

This is where it all begins. To get started:

* You must have the aws cli installed, and it should be in your $PATH *I mean, you've done this, right?*
* You must have an AWS_PROFILE set (multiple ones for all of your accounts)
* `cat ~/.aws/credentials`

```bash
    [master]
    aws_access_key_id = *ACCESS_KEY_ID*
    aws_secret_access_key = *SECRET_ACCESS_KEY*
    [account_a]
    aws_access_key_id = *ACCESS_KEY_ID*
    aws_secret_access_key = *SECRET_ACCESS_KEY*
    [account_b]
    aws_access_key_id = *ACCESS_KEY_ID*
    aws_secret_access_key = *SECRET_ACCESS_KEY*
```

* export AWS_REGION:
* `perseus:start-here jamesp$ export AWS_REGION="us-west-2"`
* execute bootstrap.sh to create the remote state s3 bucket and dynamodb lock table