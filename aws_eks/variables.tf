#-----------------------------------------------------------------------------------------------------------
# Global variables
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
  type    = string
}
variable cluster_version {
  type        = string
  description = "description"
}
variable cluster_endpoint_public_access {
  type        = bool
  description = "description"
}
variable cluster_endpoint_private_access {
  type        = bool
  description = "description"
}
variable cluster_enabled_log_types {
  type        = list(string)
  description = "description"
}
variable enable_irsa {
  type        = bool
  description = "description"
}
