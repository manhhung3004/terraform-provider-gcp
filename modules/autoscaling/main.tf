resource "google_compute_instance_group_manager" "instance_group_manager" {
  name = var.instance_group_name
  zone = var.gcp_zone
  version {
    instance_template = google_compute_instance_template.instance_template.self_link
  }
  target_size        = var.target_size
  base_instance_name = var.base_instance_name

  lifecycle {
    create_before_destroy = true
  }
}