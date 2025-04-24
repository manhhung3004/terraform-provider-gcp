variable "project" {
  type = string
}


variable "network_name" {
  description = "network name"
  type        = string
  default     = "my-network"
}

variable "subnet_name_prefix" {
  description = "subnets name"
  type        = string
  default     = "subnet"
}

variable "vpc_cidr" {
  description = "List CIDR for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "database_subnets" {
  type = list(string)
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-east1-a"
}

variable "firewall_name" {
  description = "firewall name"
  type        = string
  default     = "default-firewall"
}

variable "allowed_tcp_ports" {
  description = "List TCP port allow"
  type        = list(string)
  default     = ["22", "80", "443"]
}

variable "allowed_udp_ports" {
  description = "List UDP port allow"
  type        = list(string)
  default     = []
}

variable "source_ranges" {
  description = "List source ranges for firewall"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
