output "network_vpc_id" {
  value = module.network.vpc_id
}

output "network_subnet_ids" {
  value = module.network.subnet_ids
}

output "compute_instance_ids" {
  value = module.compute.instance_ids
}

output "compute_public_ips" {
  value = module.compute.public_ips
}

output "storage_bucket_names" {
  value = module.storage.bucket_names
}