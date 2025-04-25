
output "network_id" {
  value = google_compute_network.network.id
}

output "subnet_ids" {
  value = [for subnet in google_compute_subnetwork.subnetwork : subnet.id]
}

output "network_name" {
  value = google_compute_network.network.name
}

output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    lb  = module.lb_sg.security_group.id
    web = module.web_sg.security_group.id
    db  = module.db_sg.security_group.id
  }
}

output "database_subnet_self_links" {
  description = "Self-links of the database subnets"
  value       = [for subnet in google_compute_subnetwork.database_subnets : subnet.self_link]
}