resource "google_compute_global_address" "default" {
  name = "${var.address_name}-address"
}

resource "google_compute_managed_ssl_certificate" "default" {
  provider = google-beta

  name = "${var.cert_name}-cert"
  managed {
    domains = ["${var.domain}"]
  }
}

resource "google_compute_region_network_endpoint_group" "cloudrun_neg" {
  provider              = google-beta
  name                  = "${var.neg_name}-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = var.cloud_run_service_name
  }
}

resource "google_compute_backend_service" "default" {
  name      = "${var.bck_end_name}-backend"

  protocol  = "HTTP"
  port_name = "http"
  timeout_sec = 30

  backend {
    group = google_compute_region_network_endpoint_group.cloudrun_neg.id
  }
}

resource "google_compute_url_map" "default" {
  name            = "${var.url_name}-urlmap"

  default_service = google_compute_backend_service.default.id
}

resource "google_compute_target_https_proxy" "default" {
  name   = "${var.proxy_name}-https-proxy"

  url_map          = google_compute_url_map.default.id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.default.id
  ]
}

resource "google_compute_global_forwarding_rule" "default" {
  name   = "${var.fwd_rule_name}-lb"

  target = google_compute_target_https_proxy.default.id
  port_range = "443"
  ip_address = google_compute_global_address.default.address
}