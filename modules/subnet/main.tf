resource "google_compute_subnet" "main" {
  name          = var.subnet_name
  region        = var.region
  description   = var.subnet_description 
  network       = var.network
  ip_cidr_range = var.ip_cidr_range
  private_ip_google_access = var.private_ip_google_access

  depends_on = [google_compute_network.network]
  lifecycle {
    prevent_destroy = true
  }
}