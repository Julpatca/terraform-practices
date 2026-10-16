locals {
  sufix = "${var.tags.Project}-${var.tags.Environment}-${var.tags.Region}" # recurso-Terraform-dev-virginia
}

resource "random_string" "sufijo-s3" {
  length  = 8
  special = false
  upper   = false
}

locals {
  s3-sufix = lower("${var.tags.Project}-${var.tags.Environment}-${var.tags.Region}-${random_string.sufijo-s3.id}")
}