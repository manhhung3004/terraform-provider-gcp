# resource "aws_vpc" "staging_vpc" {
#   cidr_block = var.vpc_cidr
#   enable_dns_support = true
#   enable_dns_hostnames = true
#   tags = {
#     Name = "${var.project}-staging-vpc"
#   }
# }

# resource "aws_subnet" "staging_subnet" {
#   count = var.subnet_count
#   vpc_id = aws_vpc.staging_vpc.id
#   cidr_block = element(var.subnet_cidrs, count.index)
#   availability_zone = element(var.availability_zones, count.index)
#   tags = {
#     Name = "${var.project}-staging-subnet-${count.index}"
#   }
# }

# module "network" {
#   source = "../../modules/network"
#   project = var.project
#   vpc_cidr = var.vpc_cidr
#   subnet_cidrs = var.subnet_cidrs
#   availability_zones = var.availability_zones
# }

# module "compute" {
#   source = "../../modules/compute"
#   project = var.project
#   instance_type = var.instance_type
#   ami_id = var.ami_id
#   subnet_id = aws_subnet.staging_subnet[*].id
# }

# module "storage" {
#   source = "../../modules/storage"
#   project = var.project
#   bucket_name = var.bucket_name
# }

# output "vpc_id" {
#   value = aws_vpc.staging_vpc.id
# }

# output "subnet_ids" {
#   value = aws_subnet.staging_subnet[*].id
# }

# output "instance_ids" {
#   value = module.compute.instance_ids
# }

# output "bucket_name" {
#   value = module.storage.bucket_name
# }