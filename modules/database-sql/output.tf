output "postgres_password" {
  value       = random_password.postgres_password.result
  description = "The randomly generated password for the PostgreSQL user."
  sensitive   = true
}