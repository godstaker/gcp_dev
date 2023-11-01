output "service_account_email" {
  description = "Email address of the created GCP service account"
  value       = google_service_account.service_account.email
}