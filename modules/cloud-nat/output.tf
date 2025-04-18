output "nat_name" {
  description = "Tên của Cloud NAT"
  value       = google_compute_router_nat.cloud_nat.name
}

output "router_name" {
  description = "Tên của Cloud Router"
  value       = google_compute_router.nat_router.name
}
