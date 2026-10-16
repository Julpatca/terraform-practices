resource "aws_s3_bucket" "terraform_bucket" {
  bucket = local.s3-sufix
}