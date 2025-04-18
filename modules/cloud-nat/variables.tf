variable "router_name" {
  description = "Tên của Cloud Router"
  type        = string
}

variable "nat_name" {
  description = "Tên của Cloud NAT"
  type        = string
}

variable "network" {
  description = "Tên VPC để gắn Cloud NAT"
  type        = string
}

variable "region" {
  description = "Vùng (region) để triển khai Cloud NAT"
  type        = string
}

variable "enable_logging" {
  description = "Bật/tắt logging cho Cloud NAT"
  type        = bool
  default     = false
}
