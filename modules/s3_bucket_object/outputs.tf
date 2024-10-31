output "object_url" {
  description = "URL of the uploaded object"
  value       = "http://${var.bucket_name}.s3-website-${var.aws_region}.amazonaws.com/${var.object_key}"
}
