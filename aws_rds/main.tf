resource "random_id" "id" {
  byte_length = 2
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.1.0"


  identifier                             = "${var.env}-${var.group}-${random_id.id.hex}"
  username                               = var.user_name
  manage_master_user_password            = var.manage_master_user_password
  engine                                 = var.engine
  engine_version                         = var.engine_version
  major_engine_version                   = var.major_engine_version
  family                                 = var.db_parameter_group_family

  storage_encrypted                      = var.storage_encrypted
  allow_major_version_upgrade            = var.allow_major_version_upgrade

  instance_class                         = var.instance_class
  allocated_storage                      = var.allocated_storage
  deletion_protection                    = var.deletion_protection
  create_db_subnet_group                 = var.create_db_subnet_group
  db_subnet_group_name                   = data.aws_vpc.main.tags.Name
  db_subnet_group_use_name_prefix        = var.db_subnet_group_use_name_prefix
  subnet_ids                             = data.aws_subnets.database.ids
  vpc_security_group_ids                 = [module.security_group_rds.security_group_id]
  skip_final_snapshot                    = var.skip_final_snapshot
  maintenance_window                     = var.maintenance_window
  apply_immediately                      = var.apply_immediately

  ## Monitoring
  create_cloudwatch_log_group            = var.create_cloudwatch_log_group
  enabled_cloudwatch_logs_exports        = var.enabled_cloudwatch_logs_exports
  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days

  tags = {
    env      = var.env
    group    = var.group
    app      = var.app
    terrform = "true"
  }

}