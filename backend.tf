terraform {
  backend "s3" {
    bucket         = "terraformbackend-codepipeline"
    key            = "gitops/codepipeline.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}