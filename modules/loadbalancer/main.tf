resource "google_compute_health_check" "health_check" {
  name               = "${var.loadbalancer_name}-health-check"
  timeout_sec        = 5
  check_interval_sec = 10

  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "backend" {
  name          = var.backend_service_name
  protocol      = var.protocol
  port_name     = var.port_name
  health_checks = [google_compute_health_check.health_check.self_link]
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.loadbalancer_name}-url-map"
  default_service = google_compute_backend_service.backend.self_link
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = var.loadbalancer_name
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "${var.loadbalancer_name}-fwd-rule"
  target     = google_compute_target_http_proxy.http_proxy.self_link
  port_range = "80"
}
