terraform {
  backend "gcs" {
    bucket = "av-gcp-tf"       # Replace with your bucket name
    prefix = "terraform/state" # Customize as needed
  }
}
