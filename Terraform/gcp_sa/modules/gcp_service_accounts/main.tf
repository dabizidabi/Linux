locals {
  accounts = flatten([
    for account in var.service-accounts.members : [
      for role in var.service-accounts.roles : { 
        account = account
        roles = role
        }
    ]
  ])

  bindings = [ for member in var.service-accounts.members : 
     "serviceAccount:${var.stack}-${var.ace-project}-${member}@${var.project-id}.iam.gserviceaccount.com" ]
}


resource "google_service_account" "service-account" {
  for_each = toset(var.service-accounts.members)
  account_id   = "${var.stack}-${var.ace-project}-${each.key}"
  display_name = "For use by ${each.key}"
}

resource "google_project_iam_binding" "sa-bindings" {
  for_each = {
    for item in local.accounts : "${item.account}.${item.roles}" => item
  }
  project = google_service_account.service-account[lookup(each.value, "account")].project
  members = local.bindings
  role    = lookup(each.value, "roles")
}
