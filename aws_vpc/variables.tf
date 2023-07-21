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
variable "azs" {
  type    = list(any)
}
variable "vpc_cidr" {
  type    = string
}
variable "private_subnets" {
  type    = list(any)
}
variable "public_subnets" {
  type    = list(any)
}
variable "database_subnets" {
  type    = list(any)
}
variable "vpc_enable_nat_gateway" {
  default = true
}
variable "vpc_single_nat_gateway" {
  default = true
}
variable "enable_dns_hostnames" {
  default = true
}
variable "enable_dns_support" {
  default = true
}
