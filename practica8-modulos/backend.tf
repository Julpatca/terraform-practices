# terraform {
#   required_version = ">= 1.0.0"
#
#   backend "s3" {
#     region  = "us-east-1"
#     bucket  = "exampledcnifcmzkl-prd-terraform-state"
#     key     = "terraform.tfstate"
#     profile = ""
#     encrypt = "true"
#
#     dynamodb_table = "exampledcnifcmzkl-prd-terraform-state-lock"
#   }
# }
