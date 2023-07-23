data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnets" "all" {
}

data "aws_subnets" "database" {
  filter {
    name   = "tag:Name"
    values = ["${data.aws_vpc.main.tags.Name}-db*"]
  }
}