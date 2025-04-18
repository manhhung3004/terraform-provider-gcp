resource "google_compute_disk" "compute_disk" {
  name   = var.disk_name
  zone   = var.zone
  size   = var.size
  type   = var.disk_type
  labels = var.labels
}