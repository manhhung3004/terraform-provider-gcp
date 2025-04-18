variable "network_name" {
  description = "Tên network"
  type        = string
  default     = "my-network"
}

variable "subnet_name_prefix" {
  description = "Tiền tố cho tên subnets"
  type        = string
  default     = "subnet"
}

variable "subnet_cidrs" {
  description = "Danh sách CIDR cho subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "asia-east1-a"
}

variable "firewall_name" {
  description = "Tên firewall"
  type        = string
  default     = "default-firewall"
}

variable "allowed_tcp_ports" {
  description = "Danh sách các cổng TCP được phép"
  type        = list(string)
  default     = ["22", "80", "443"]
}

variable "allowed_udp_ports" {
  description = "Danh sách các cổng UDP được phép"
  type        = list(string)
  default     = []
}

variable "source_ranges" {
  description = "Danh sách các source ranges cho firewall"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}