variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
  default     = "hello_world"
}

variable "image" {
  description = "Docker image to deploy on Cloud Run"
  type        = string
}

variable "region" {
  description = "Google Cloud region for the Cloud Run service"
  type        = string
  default     = "europe-west2"
}
