resource "google_service_account" "service_account" {
  account_id   = var.service_account_name
  project      = var.project
  display_name = var.service_account_name
}

/*
resource "google_project_iam_member" "iam_member" {
  count   = length(var.roles)
  project = var.project
  role    = var.roles[count.index]
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
*/
