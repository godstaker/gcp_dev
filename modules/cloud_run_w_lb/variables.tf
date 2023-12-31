variable "service_name" {
  description = "Name of the Cloud Run service"
  type        = string
  default     = "hello_world"
}

variable "image" {
  description = "Docker image to deploy on Cloud Run"
  type        = string
  default     = "gcr.io/google-samples/hello-app:1.0"
}

variable "region" {
  description = "Google Cloud region for the Cloud Run service"
  type        = string
  default     = "europe-west2"
}

variable "members" {
  description = "A list of members (identities) to grant the role"
  type        = string
}

variable "forwarding_rule_name" {
  
}

variable "url_map_name" {
  
}

variable "backend_service_name" {
  
}

variable "backend_description" {
  
}

variable "health_check_name" {
  
}