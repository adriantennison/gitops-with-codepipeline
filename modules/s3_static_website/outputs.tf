output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.this.id
}

output "website_endpoint" {
  description = "Website endpoint URL"
  value       = aws_s3_bucket.this.website_endpoint
}
