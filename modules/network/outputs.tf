
output "network_id" {
  value = google_compute_network.network.id
}

output "subnet_ids" {
  value = [for subnet in google_compute_subnetwork.subnetwork : subnet.id]
}

output "network_name" {
  value = google_compute_network.network.name
}