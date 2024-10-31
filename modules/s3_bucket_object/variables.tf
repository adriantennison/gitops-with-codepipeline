variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "object_key" {
  description = "Key (path) of the object in the bucket"
  type        = string
}

variable "source_file" {
  description = "Path to the source file"
  type        = string
}

variable "content_type" {
  description = "Content-Type of the file"
  type        = string
  default     = "text/html"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}