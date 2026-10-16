resource "aws_s3_bucket" "my_test_bucket" {
  count  = 6
  bucket = "bucket-lab3-${random_string.sufijo[count.index].id}"
}

resource "random_string" "sufijo" {
  count   = 6
  length  = 8
  special = false
  upper   = false
  numeric = false
}