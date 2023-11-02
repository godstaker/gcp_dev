terraform {
  required_version = ">= 0.14"

  required_providers {
    # Cloud Run support was added on 3.3.0
    google = ">= 3.3"
  }
}

# Enable required api
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}
# Create a Cloud Run service
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"

  disable_on_destroy = true
}

resource "google_cloud_run_service" "cloud_run" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  # Waits for the Cloud Run API to be enabled
  depends_on = [google_project_service.run_api]
}

# Create a Global HTTP(S) Load Balancer
resource "google_compute_global_forwarding_rule" "example" {
  name       = var.forwarding_rule_name
  target     = google_cloud_run_service.cloud_run.status[0].url
  port_range = "80"
}

# Create a URL map
resource "google_compute_url_map" "example" {
  name        = var.url_map_name
  default_service = google_cloud_run_service.cloud_run.status[0].url
}

# Create a backend service
resource "google_compute_backend_service" "example" {
  name        = var.backend_service_name
  protocol    = "HTTP"
  timeout_sec = 10

  backend {
    description = var.backend_description
    group       = google_cloud_run_service.cloud_run.status[0].url
  }
}

# Create a health check
resource "google_compute_health_check" "example" {
  name               = var.health_check_name
  check_interval_sec = 10
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
    request_path = "/"
  }
}

# Create a backend service health check
resource "google_compute_backend_service_health_check" "example" {
  backend_service = google_compute_backend_service.example.id
  health_check    = google_compute_health_check.example.id
}

# Create a URL map path matcher
resource "google_compute_url_map_path_matcher" "example" {
  name            = "example-path-matcher"
  default_service = google_compute_backend_service.example.id
  path_rule {
    paths = ["/*"]
    service = google_compute_backend_service.example.id
  }
}

# Create a URL map host rule
resource "google_compute_url_map_host_rule" "example" {
  name    = "example-host-rule"
  host    = "example.com"
  path_matcher = google_compute_url_map_path_matcher.example.id
}

# Create a global forwarding rule
resource "google_compute_global_forwarding_rule" "example" {
  name        = "example-forwarding-rule"
  target      = google_compute_url_map.example.id
  port_range  = "80"
}

# Configure access to Cloud Run service
resource "google_cloud_run_service_iam_member" "binding" {
  location = google_cloud_run_service.cloud_run.location
  project  = google_cloud_run_service.cloud_run.project
  service  = google_cloud_run_service.cloud_run.name
  role     = "roles/run.invoker"
  member   = var.members

  depends_on = [ google_cloud_run_service.cloud_run ]
}