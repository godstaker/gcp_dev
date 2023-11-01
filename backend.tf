terraform {
  backend "gcs" {
    bucket = "bucket"       # Replace with your bucket name
    prefix = "terraform/state" # Customize as needed
  }
}
