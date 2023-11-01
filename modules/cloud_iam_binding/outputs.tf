output "service_account_permission" {
  description = "Permission granted to the service account to invoke the Cloud Run service."
  value       = google_cloud_run_service_iam_binding.cloud_run_service_iam_binding
}
