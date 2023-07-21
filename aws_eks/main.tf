data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnets" "all" {
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["${data.aws_vpc.main.tags.Name}-public*"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["${data.aws_vpc.main.tags.Name}-private*"]
  }
}

resource "random_id" "id" {
  byte_length = 2
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"
  cluster_name    = "${var.env}-${var.group}-${var.app}-${random_id.id.hex}"
  cluster_version = var.cluster_version
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = true
  cluster_enabled_log_types  = var.cluster_enabled_log_types
  enable_irsa                    = true
  # manage_aws_auth_configmap    = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  
  vpc_id                   = data.aws_vpc.main.id
  subnet_ids               = data.aws_subnets.private.ids 
  # Extend cluster security group rules
  cluster_security_group_additional_rules = {
    egress_nodes = {
      description                = "All open to worker node"
      protocol                   = "-1"
      from_port                  = 0
      to_port                    = 0
      type                       = "egress"
      source_node_security_group = true
    }
    ingress_nodes = {
      description                = "All open to worker node"
      protocol                   = "-1"
      from_port                  = 0
      to_port                    = 0
      type                       = "ingress"
      source_node_security_group = true
    }
  }
# EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = 50
    ami_type       = "AL2_x86_64"
  }
  eks_managed_node_groups = {
    application = {
      instance_types = ["t3a.medium"]
      min_size     = 1
      max_size     = 10
      desired_size = 1
      capacity_type = "ON_DEMAND"
      labels = {
        key = "test"
      }
    }
  }
  # Node Security Group Additional Rules
  node_security_group_additional_rules = {
    ingress_self_all = {
      description = "Node to node all ports/protocols"
      protocol = "-1"
      from_port = 0
      to_port = 0
      type = "ingress"
      self = true
    }
    ingress_cluster_all = {
      description = "Cluster to node all ports/protocols"
      protocol = "-1"
      from_port = 0
      to_port = 0
      type = "ingress"
      source_cluster_security_group = true
    }
    egress_all = {
      description = "Node all egress"
      protocol = "-1"
      from_port = 0
      to_port = 0
      type = "egress"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}
