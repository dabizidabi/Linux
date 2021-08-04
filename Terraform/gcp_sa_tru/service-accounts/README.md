## Overview
Creates a service account for each service in the Engage (Chockstone) stack.


## Usage (Same as parent directory)
### Usage by DevOps
1. Create a service account for accessing the desired project
2. Create a key file for created sevice account and save it locally (default: `~/ceg/pid-gousgnad-aces-dev-merlin-b82c0cfa7980.json`)
3. `cd ace-ceg-terrafrm/ACE/GSV/GCP/dev/dev-merlin/service-accounts`
4. Execute `terraform apply` or `terraform apply -var="credentials-file=$CREDENTIALS_FILE_PATH"`
   
### Deploy to dev's project by developer
1. `gcloud auth login`
2. `gcloud config set project $PROJECT_ID`
3. `cd ace-ceg-terrafrm/ACE/GSV/GCP/dev/dev-merlin/service-accounts`
4. `terraform apply -var="project-id=$PROJECT_ID" -var="credentials-file="`



## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_service-accounts"></a> [service-accounts](#module\_service-accounts) | ../../../modules/gcp_service_accounts | n/a |

## Resources

| Name | Type |
|------|------|
| [google_service_account_iam_policy.id-svc-workload](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_policy) | resource |
| [google_service_account_iam_policy.xref-svc-workload](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_policy) | resource |
| [google_iam_policy.id-svc-workloadIdentityUser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |
| [google_iam_policy.xref-svc-workloadIdentityUser](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ace-project"></a> [ace-project](#input\_ace-project) | The name of project | `string` | `"merlin"` | no |
| <a name="input_credentials-file"></a> [credentials-file](#input\_credentials-file) | n/a | `string` | `"~/ceg/pid-gousgnad-aces-dev-merlin-b82c0cfa7980.json"` | no |
| <a name="input_k8s-namespace"></a> [k8s-namespace](#input\_k8s-namespace) | Kubernetes namespace for the service account | `string` | `"default"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of project | `string` | `"us-east1"` | no |
| <a name="input_project-id"></a> [project-id](#input\_project-id) | The GCP project id | `string` | `"pid-gousgnad-aces-dev-merlin"` | no |
| <a name="input_service-accounts"></a> [service-accounts](#input\_service-accounts) | Map of members and roles to add the IAM policies/bindings | `map` | <pre>{<br>  "members": [<br>    "id-svc-sa",<br>    "xref-svc-sa"<br>  ],<br>  "roles": [<br>    "roles/cloudsql.client",<br>    "roles/cloudsql.instanceUser",<br>    "roles/cloudsql.admin",<br>    "roles/pubsub.viewer"<br>  ]<br>}</pre> | no |
| <a name="input_stack"></a> [stack](#input\_stack) | The stack of project | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service-account-email"></a> [service-account-email](#output\_service-account-email) | The email of the service account. |
| <a name="output_service-account-full-id"></a> [service-account-full-id](#output\_service-account-full-id) | The fully-qualified id of the service account. |
| <a name="output_service-account-id"></a> [service-account-id](#output\_service-account-id) | The account ID of the service account. |
| <a name="output_service-account-name"></a> [service-account-name](#output\_service-account-name) | The fully-qualified name of the service account. |
| <a name="output_service-account-role"></a> [service-account-role](#output\_service-account-role) | The role that should be applied. |
| <a name="output_service-account-role-id"></a> [service-account-role-id](#output\_service-account-role-id) | The role ID that should be applied. |
