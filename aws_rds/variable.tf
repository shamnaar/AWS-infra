## Some values need to be updated before redeploying, please check the hashed text ##

#-----------------------------------------------------------------------------------------------------------
# GLOBAL Vars
#-----------------------------------------------------------------------------------------------------------

variable "env" {
  type    = string
}

variable "group" {
  type    = string
}

variable "app" {
  type    = string
}

variable "aws_region" {
  type    = string
}

#-----------------------------------------------------------------------------------------------------------
# VPC Vars
#-----------------------------------------------------------------------------------------------------------

variable "vpc_id" {
}

# ## Update if you redeployed the current VPC ##
# variable "vpc_cidr" {
# }

# ## Update if you redeployed the current VPC ##
# variable "db_subnet_group_name" {
#   description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC"
#   type        = string
# }

variable "create_db_subnet_group" {
  description = "Whether to create a database subnet group"
  type        = bool
  default     = true
}

variable "db_subnet_group_use_name_prefix" {
  description = "Determines whether to use `subnet_group_name` as is or create a unique name beginning with the `subnet_group_name` as the prefix"
  type        = bool
  default     = true
}

# ## Update if you redeployed the current VPC ## 
# variable "subnet_ids" {
#   description = "A list of VPC subnet IDs for the database"
#   type        = list(string)
# }

#-----------------------------------------------------------------------------------------------------------
# RDS Vars
#-----------------------------------------------------------------------------------------------------------

# variable "password" {
#   description = <<EOF
#   Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file.
#   The password provided will not be used if `manage_master_user_password` is set to true.
#   EOF
#   type        = string
#   default     = null
#   sensitive   = true
# }

variable "manage_master_user_password" {
  description = "Set to true to allow RDS to manage the master user password in Secrets Manager"
  type        = bool
}

variable "user_name" {
  description = "The database engine to use"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = string
  default     = 10
}

variable "db_parameter_group_family" {
  description = "The family of the DB parameter group"
  type        = string
}

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
}

variable "engine_version" {
  description = "The engine version to use"
  type        = string
}

variable "engine" {
  description = "The database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}


variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true"
  type        = bool
  default = false
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted"
  type        = bool
  default     = false
}

variable "create_db_option_group" {
  description = "Create a database option group"
  type        = bool
  default     = true
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type        = bool
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = "Sun:02:00-Sun:03:00"
}

## logs
variable "enabled_cloudwatch_logs_exports" {
  description = "List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL)"
  type        = list(string)
  default     = []
}

variable "create_cloudwatch_log_group" {
  description = "Determines whether a CloudWatch log group is created for each `enabled_cloudwatch_logs_exports`"
  type        = bool
  default     = false
}

variable "cloudwatch_log_group_retention_in_days" {
  description = "The number of days to retain CloudWatch logs for the DB instance"
  type        = number
  default     = 7
}
