output "vpc_id" {
  value = module.network.vpc_id
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "instance_ids" {
  value = module.compute.instance_ids
}

output "bucket_names" {
  value = module.storage.bucket_names
}