provider "aws" {
  region = var.aws_region
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper = false
}


locals {
  bucket_name = "${var.bucket_prefix}-${random_string.suffix.result}"
}

module "s3_static_website" {
  source = "./modules/s3_static_website"
  bucket_name = local.bucket_name
  tags        = var.common_tags
}

module "index_html" {
  source       = "./modules/s3_bucket_object"
  bucket_name  = local.bucket_name
  object_key   = "index.html"
  source_file  = "${path.module}/files/index.html"
  content_type = "text/html"
  depends_on = [ module.s3_static_website ]
}

module "error_html" {
  source       = "./modules/s3_bucket_object"
  bucket_name  = local.bucket_name
  object_key   = "error.html"
  source_file  = "${path.module}/files/error.html"
  content_type = "text/html"
  depends_on = [ module.s3_static_website ]
}

output "website_url" {
  description = "URL to access the website"
  value       = module.s3_static_website.website_endpoint
}

module "sample_secret" {
  source      = "./modules/ssm_parameter"
  name        = "/gitops/sample_secret"
  type        = "SecureString"
  value       = var.sample_secret_value
  description = "Sample secret parameter"
}
