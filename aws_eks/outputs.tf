output "vpc_name" {
  value = data.aws_vpc.main.tags.Name
}
output "subnet_cidrs" {
  value = data.aws_subnets.all.ids
}
output "subnet_public" {
  value = data.aws_subnets.public
}
output "subnet_private" {
  value = data.aws_subnets.private
}
# output "concat_test" {
#     value = concat(data.aws_subnets.public.ids, data.aws_subnets.private.ids)
# }
