variable "service_account_email" {
  description = "The email of the service account to grant permissions to"
  type        = string
}

variable "cloud_run_service_name" {
  description = "Name of the Cloud Run service to grant permissions for"
  type        = string
}