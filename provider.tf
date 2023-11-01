provider "google" {
  credentials = file("path/to/key.json")
  project     = "var.project"
  region      = "var.region"
}

# Your resources and configurations here
