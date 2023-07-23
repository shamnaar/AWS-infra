## Global Parameters
env                    = "dev"
group                  = "devops"
app                    = "sample"
aws_region             = "us-east-1" #"REGION"

## VPC Parameters
vpc_id                          = "vpc-xxxx" #update vpc_id
user_name                       = "admin"
manage_master_user_password     = true
engine                          = "mysql"
major_engine_version            = "8.0"
engine_version                  = "8.0.33"
db_parameter_group_family       = "mysql8.0"
instance_class                  = "db.t2.micro"
allocated_storage               = "10"
storage_encrypted               = false # t2.micro doesn't support storage encryption
deletion_protection             = false
skip_final_snapshot             = true
auto_minor_version_upgrade      = false
maintenance_window              = "Sun:02:00-Sun:03:00"
enabled_cloudwatch_logs_exports = ["audit", "error", "slowquery"]
create_cloudwatch_log_group     = true