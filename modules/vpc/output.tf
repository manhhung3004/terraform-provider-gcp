output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "subnet_a_id" {
  value = google_compute_subnetwork.subnet_a.self_link
}

output "subnet_b_id" {
  value = google_compute_subnetwork.subnet_b.self_link
}

output "firewall_rule_name" {
  value = google_compute_firewall.allow_common_ports.name
}
