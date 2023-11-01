resource "google_cloud_run_service_iam_binding" "cloud_run_service_iam_binding" {
  service = var.cloud_run_service_name

  role    = "roles/run.invoker"
  members = [var.service_account_email]
}