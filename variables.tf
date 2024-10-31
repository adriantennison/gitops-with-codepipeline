variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
  default     = "mygitopswebsite"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Project     = "GitOpsDemo"
    Environment = "Dev"
  }
}

variable "sample_secret_value" {
  description = "Sample secret value stored in Parameter Store"
  type        = string
  sensitive   = true
}

variable "notification_email" {
  description = "Email address to receive notifications"
  type        = string
}

