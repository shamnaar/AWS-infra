## Global Parameters
env        = "dev"
group      = "devops"
app        = "sample"
aws_region = "us-east-1" #"REGION"
## VPC Parameters
vpc_id                          = "vpc-xxxx" #Change vpc_id
cluster_version                 = "1.27"
cluster_enabled_log_types       = ["audit", "api", "authenticator"]
cluster_endpoint_public_access  = true
cluster_endpoint_private_access = true
enable_irsa                     = true
manage_aws_auth_configmap       = true
admin_rolearn                   = "arn:aws:iam::xxxx:role/AWSReservedSSO_AdministratorAccess_8dd6ce1517b1d023"
user_arn                        = "arn:aws:iam::xxxx:user/admin"
## Node Parameters
instance_types = ["t3a.medium"]
