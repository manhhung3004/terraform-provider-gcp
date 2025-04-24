resource "google_api_gateway_api" "api-gateway" {
  name        = var.api_gateway_name
  type        = var.api_gateway_type
  description = var.api_gateway_description
  region      = var.region

  api_config {
    api_id   = var.api_id
    api_name = var.api_name
    api_type = var.api_type
  }

  backend_service {
    backend_service_name = var.backend_service_name
    backend_service_url  = var.backend_service_url
  }

  security_policy {
    security_policy_name = var.security_policy_name
    security_policy_url  = var.security_policy_url
  }
}