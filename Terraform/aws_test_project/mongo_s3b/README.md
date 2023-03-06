<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.50.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.s3_terraform_state_lock](https://registry.terraform.io/providers/hashicorp/aws/4.50.0/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.tfstate_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.50.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/4.50.0/docs/resources/s3_bucket_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket-name"></a> [bucket-name](#input\_bucket-name) | The name of s3 bucket | `string` | `"dabizidabi-terrafrom"` | no |
| <a name="input_dynamodb-lock-table"></a> [dynamodb-lock-table](#input\_dynamodb-lock-table) | Name of DynamoDB Table to use for state locking and consistency. | `string` | `"s3terraformlock"` | no |
| <a name="input_region"></a> [region](#input\_region) | Resources region | `string` | `"eu-west-1"` | no |
| <a name="input_tfstate-path"></a> [tfstate-path](#input\_tfstate-path) | The path where state is written to | `string` | `"mngm/s3"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->