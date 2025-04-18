resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet_a" {
  name          = var.subnet_a_name
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnet_a_cidr
  region        = var.region
}

resource "google_compute_subnetwork" "subnet_b" {
  name          = var.subnet_b_name
  network       = google_compute_network.vpc.self_link
  ip_cidr_range = var.subnet_b_cidr
  region        = var.region
}

resource "google_compute_firewall" "allow_common_ports" {
  name    = "allow-common-ports"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]  
}
