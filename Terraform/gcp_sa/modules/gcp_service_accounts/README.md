Creates service account and sets IAM roles to the service account.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 3.77.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.77.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_binding.sa-bindings](https://registry.terraform.io/providers/hashicorp/google/3.77.0/docs/resources/project_iam_binding) | resource |
| [google_service_account.service-account](https://registry.terraform.io/providers/hashicorp/google/3.77.0/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ace-project"></a> [ace-project](#input\_ace-project) | The name of project | `string` | `""` | no |
| <a name="input_project-id"></a> [project-id](#input\_project-id) | The GCP project id | `string` | `""` | no |
| <a name="input_service-accounts"></a> [service-accounts](#input\_service-accounts) | Map of members and roles to add the IAM policies/bindings | `map` | `{}` | no |
| <a name="input_stack"></a> [stack](#input\_stack) | The stack of project | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service-account-email"></a> [service-account-email](#output\_service-account-email) | The email of the service account. |
| <a name="output_service-account-full-id"></a> [service-account-full-id](#output\_service-account-full-id) | The fully-qualified id of the service account. |
| <a name="output_service-account-id"></a> [service-account-id](#output\_service-account-id) | The account ID of the service account. |
| <a name="output_service-account-name"></a> [service-account-name](#output\_service-account-name) | The fully-qualified name of the service account. |
| <a name="output_service-account-role"></a> [service-account-role](#output\_service-account-role) | The role that should be applied. |
| <a name="output_service-account-role-id"></a> [service-account-role-id](#output\_service-account-role-id) | The role ID that should be applied. |
