output "loadbalancer_name" {
  value = google_compute_global_forwarding_rule.forwarding_rule.name
}

output "backend_service" {
  value = google_compute_backend_service.backend.self_link
}

output "url_map" {
  value = google_compute_url_map.url_map.self_link
}
