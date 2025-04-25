# Create subnetwork for Cloud SQL
resource "google_compute_subnetwork" "subnetwork" {
  name          = "${var.sql_name}-subnet"
  ip_cidr_range = "10.0.10.0/24"
  region        = var.region
  network       = var.vpc_self_link
}

# IP private for VPC peering
resource "google_compute_global_address" "private_ip_alloc" {
  name          = "${var.sql_name}-private-ip-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.vpc_self_link
}

# Connect VPC peering between VPC and Google cloud service
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]

  depends_on = [google_compute_global_address.private_ip_alloc]
}

# Create Cloud SQL Instance with Private IP
resource "google_sql_database_instance" "sql_instance" {
  name             = var.sql_name
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-g1-small"

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.vpc_self_link
    }
  }

  deletion_protection = false

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

# Create user with PostgreSQL
resource "random_password" "postgres_password" {
  length           = 16
  special          = true
  override_special = "!@#$%&*()-_=+[]{}<>?"
}

resource "google_sql_user" "default" {
  name     = "postgres"
  instance = google_sql_database_instance.sql_instance.name
  password = random_password.postgres_password.result
}

# create database with name app_db
resource "google_sql_database" "app_db" {
  name     = "app_db"
  instance = google_sql_database_instance.sql_instance.name
}
