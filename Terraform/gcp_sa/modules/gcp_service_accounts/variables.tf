variable "project-id" {
  description = "The GCP project id"
  default = ""
}

variable "stack" {
  description = "The stack of project"
  default     = ""
}

variable "ace-project" {
  description = "The name of project"
  default     = ""
}

variable "service-accounts" {
    description = "Map of members and roles to add the IAM policies/bindings"
    type = map
    default = {}
}

/*-----EXAMPLE
variable "service-accounts" {
  type = map
  default = {
    "members" =  [
        "service1",
        "service2",
        "service3"
      ]
    "roles" = [
        "roles/storage.objectViewer",
        "roles/logging.logWriter",
        "roles/monitoring.metricWriter",    
    ]
  }
}
*/