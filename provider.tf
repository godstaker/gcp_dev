provider "google" {
  credentials = file("path/to/key.json")
  project     = "av24042017"
  region      = "europe-west2"
}

# Your resources and configurations here
