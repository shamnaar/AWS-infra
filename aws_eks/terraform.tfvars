## Global Parameters
env                    = "dev"
group                  = "devops"
app                    = "sample"
aws_region             = "us-east-1" #"REGION"
## VPC Parameters
vpc_id                          = "vpc-05378cba677806462" #Change vpc_id
cluster_version                 = "1.27"
cluster_enabled_log_types       = ["audit", "api", "authenticator"]
cluster_endpoint_public_access  = true
cluster_endpoint_private_access = true
enable_irsa                     = true
