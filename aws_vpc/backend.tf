# terraform {
#   backend "s3" {
#     bucket = "my-terraform-state"
#     key    = "us-east-1/tfstate.json"
#     region = "us-east-1"
#     dynamodb_table = "my-dynamodb-statelock"
#     encrypt = true
#   }
# }

