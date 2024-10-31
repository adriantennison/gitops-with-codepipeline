resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.this.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "public_access" {
  depends_on = [
    aws_s3_bucket_ownership_controls.public_access,
    aws_s3_bucket_public_access_block.public_access,
  ]
  bucket = aws_s3_bucket.this.id
  acl    = "public-read"
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["*"]
    resources = [aws_s3_bucket.this.arn, "${aws_s3_bucket.this.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
  depends_on = [ aws_s3_bucket_acl.public_access ]
}

resource "aws_s3_bucket_policy" "getting_object" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

resource "aws_s3_bucket_ownership_controls" "public_access" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
