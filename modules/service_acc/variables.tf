variable "service_account_name" {
  description = "Name of the GCP service account"
  type        = string
}

variable "project" {
  description = "GCP project ID where the service account will be created"
  type        = string
  default     = "av24042017"
}

variable "roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
}
