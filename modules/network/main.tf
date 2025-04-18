resource "google_compute_network" "network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  count         = length(var.subnet_cidrs)
  name          = "${var.subnet_name_prefix}-${count.index + 1}"
  ip_cidr_range = element(var.subnet_cidrs, count.index)
  region        = var.region
  network       = google_compute_network.network.id
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = google_compute_network.network.id

  allow {
    protocol = "tcp"
    ports    = var.allowed_tcp_ports
  }

  allow {
    protocol = "udp"
    ports    = var.allowed_udp_ports
  }

  source_ranges = var.source_ranges
}