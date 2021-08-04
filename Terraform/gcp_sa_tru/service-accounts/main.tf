module "service-accounts" {
  source           = "../../../modules/gcp_service_accounts"
  project-id       = var.project-id
  stack            = var.stack
  ace-project      = var.ace-project
  service-accounts = var.service-accounts

}

data "google_iam_policy" "id-svc-workloadIdentityUser" {
  binding {
    role = "roles/iam.workloadIdentityUser"
    members = [
      "serviceAccount:${var.project-id}.svc.id.goog[${var.k8s-namespace}/${module.service-accounts.service-account-id[0]}]"
    ]
  }
}

data "google_iam_policy" "xref-svc-workloadIdentityUser" {
  binding {
    role = "roles/iam.workloadIdentityUser"
    members = [
      "serviceAccount:${var.project-id}.svc.id.goog[${var.k8s-namespace}/${module.service-accounts.service-account-id[1]}]"
    ]
  }
}

resource "google_service_account_iam_policy" "id-svc-workload" {
  service_account_id = module.service-accounts.service-account-name[0]
  policy_data        = data.google_iam_policy.id-svc-workloadIdentityUser.policy_data
}

resource "google_service_account_iam_policy" "xref-svc-workload" {
  service_account_id = module.service-accounts.service-account-name[1]
  policy_data        = data.google_iam_policy.xref-svc-workloadIdentityUser.policy_data
}