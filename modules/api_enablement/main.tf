resource "google_project_service" "enable_api" {
  project = var.project_id
  service = var.api_name
}
