module "security_group_rds" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.1.0"

  name        = "${var.env}-${var.group}-rds-${random_id.id.hex}"
  description = "MySQL security group"
  vpc_id      = var.vpc_id

  # Inbound
  ingress_cidr_blocks = ["10.20.0.0/16"]
  ingress_rules       = ["mysql-tcp"]

  # Outbound
  # egress_cidr_blocks = ["0.0.0.0/0"]
  # egress_rules = ["all-all"]

  tags = {
    env      = var.env
    group    = var.group
    app      = var.app
    terrform = "true"
  }

}