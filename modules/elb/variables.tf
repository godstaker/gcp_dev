variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "location" {
  description = "Google Cloud region (e.g., us-central1)"
}

variable "load_balancer_name" {
  description = "Name for the Load Balancer"
}

variable "cloud_run_service_name" {
  description = "Name of the Cloud Run service"
}

variable "service_region" {
  description = "Region where the Cloud Run service is deployed (e.g., us-central1)"
  default     = "europe-west2"
}