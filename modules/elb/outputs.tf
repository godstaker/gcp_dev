output "load_balancer_url" {
  description = "URL of the deployed Load Balancer"
  value       = google_compute_global_forwarding_rule.forwarding_rule.ip_address
}