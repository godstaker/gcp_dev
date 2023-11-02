variable "bucket_name" {
  description = "The name of the GCS bucket to create"
  type        = string
}

variable "project" {
  description = "Google Cloud Project ID"
  type        = string
}

variable "location" {
  description = "The location (region) for the GCS bucket"
  type        = string
  default     = "us-central1" # Set your default location
}

variable "storage_class" {
  description = "The storage class for the GCS bucket"
  type        = string
  default     = "STANDARD" # Set your default storage class
}

variable "versioning" {
  description = "Enable or disable versioning for the GCS bucket"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "Lifecycle rules for the GCS bucket"
  type        = list(map(string))
  default     = []
}

variable "labels" {
  description = "Labels to apply to the GCS bucket"
  type        = map(string)
  default     = {}
}
