provider "google" {
  credentials = var.credentials-file != "" ? file(var.credentials-file) : ""
  project     = var.project-id
  region      = var.location
}
