output "subnet_db" {
  value = data.aws_subnets.database
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rds.db_instance_endpoint
}

output secret_manager_arn {
  value       = module.rds.db_instance_master_user_secret_arn
  description = "description"
  sensitive   = true
}