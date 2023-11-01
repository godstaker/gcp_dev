resource "google_cloud_run_service_iam_binding" "cloud_run_service_iam_binding" {
  service = google_cloud_run_service.service.name

  role    = "roles/run.invoker"
  members = [var.service_account_email]
}