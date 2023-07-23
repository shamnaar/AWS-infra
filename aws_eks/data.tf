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
data "aws_eks_cluster_auth" "eks-auth" {
  name = module.eks.cluster_name
}
