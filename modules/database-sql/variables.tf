variable "project_id" {
  description = "ID of the GCP project"
  type        = string
}

variable "region" {
  description = "Region for Cloud SQL"
  type        = string
  default     = "us-central1"
}

variable "sql_name" {
  description = "Name of the Cloud SQL instance"
  type        = string
  default     = "my-private-sql"
}

variable "vpc_self_link" {
  description = "Self-link of the VPC network"
  type        = string
}

variable "postgres_password" {
  description = "Password for PostgreSQL user"
  type        = string
  sensitive   = true
}

variable "database_subnet_self_links" {
  description = "Self-links of the database subnets"
  type        = list(string)
}