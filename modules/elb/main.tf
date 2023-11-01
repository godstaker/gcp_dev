resource "google_compute_region_url_map" "url_map" {
  name     = "url-map-${var.load_balancer_name}"
  default_route_action {
    cors_policy {
      allow_credentials = true
    }
    timeout {
      idle_timeout = "60s"
    }
    url_rewrite {
      path_prefix_rewrite = "/"
    }
    weighted_backend {
      backend_service = google_compute_region_backend_service.backend_service.id
    }
  }
}

resource "google_compute_region_target_http_proxy" "target_proxy" {
  name    = "target-proxy-${var.load_balancer_name}"
  url_map = google_compute_region_url_map.url_map.id
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "forwarding-rule-${var.load_balancer_name}"
  target     = google_compute_region_target_http_proxy.target_proxy.id
  port_range = "80"
}