variable "project-id" {
  description = "The GCP project id"
  default     = "pid-gousgnad-aces-dev-merlin"
}

variable "stack" {
  description = "The stack of project"
  default     = "dev"
}

variable "ace-project" {
  description = "The name of project"
  default     = "merlin"
}

variable "location" {
  description = "The location of project"
  default     = "us-east1"
}

variable "credentials-file" {
  default = "~/ceg/pid-gousgnad-aces-dev-merlin-b82c0cfa7980.json"
}

variable "k8s-namespace" {
  default     = "default"
  description = "Kubernetes namespace for the service account"
}

variable "service-accounts" {
  description = "Map of members and roles to add the IAM policies/bindings"
  type        = map
  default = {
    "members" = [
      "id-svc-sa",
      "xref-svc-sa",
    ]
    "roles" = [
      "roles/cloudsql.client",
      "roles/cloudsql.instanceUser",
      "roles/cloudsql.admin",
      "roles/pubsub.viewer",
    ]
  }
}
