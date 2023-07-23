resource "random_id" "id" {
  byte_length = 2
}
module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "~> 19.0"
  cluster_name                    = "${var.env}-${var.group}-${var.app}-${random_id.id.hex}"
  cluster_version                 = var.cluster_version
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = true
  cluster_enabled_log_types       = var.cluster_enabled_log_types
  enable_irsa                     = true
  manage_aws_auth_configmap       = var.manage_aws_auth_configmap
  vpc_id                          = data.aws_vpc.main.id
  subnet_ids                      = concat(data.aws_subnets.public.ids, data.aws_subnets.private.ids) #concat(var.public_subnets, var.private_subnets)
  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size  = 50
    ami_type   = "AL2_x86_64"
    subnet_ids = data.aws_subnets.private.ids
  }
  eks_managed_node_groups = {
    application = {
      instance_types = var.instance_types
      min_size       = 1
      max_size       = 10
      desired_size   = 1
      capacity_type  = "ON_DEMAND"
      labels = {
        key = "test"
      }
    }
  }
  tags = {
    env      = var.env
    group    = var.group
    app      = var.app
    terrform = "true"
  }
  aws_auth_roles = [
    {
      rolearn  = var.admin_rolearn
      username = "admin"
      groups   = ["system:masters"]
    }
  ]
  aws_auth_users = [
    {
      userarn  = var.user_arn
      username = "user1"
      groups   = ["system:masters"]
    }
  ]
}
