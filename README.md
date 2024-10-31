# GitOps with AWS CodePipeline

This repository contains Terraform code to automate the deployment of a static website using AWS CodePipeline, CodeBuild, and S3. It follows best practices by utilizing modules, variables, and integrating security, compliance, monitoring, and continuous improvement processes.

## Modules

- `s3_static_website`: Sets up an S3 bucket configured for static website hosting.
- `s3_bucket_object`: Manages objects uploaded to S3 buckets.
- `ssm_parameter`: Stores parameters in AWS Systems Manager Parameter Store.

## Usage

- Clone the repository.
- Configure your AWS credentials.
- Update `terraform.tfvars` with appropriate values.
- Run `terraform init`, `terraform plan`, and `terraform apply`.

## Security and Compliance

- Sensitive data is stored securely using AWS Systems Manager Parameter Store.
- IAM roles and policies follow the principle of least privilege.
- Compliance scanning is performed using Checkov.

## Monitoring and Notifications

- CloudWatch Logs are enabled for build logs.
- CloudWatch Alarms and SNS are configured to send notifications on build failures.

## Continuous Improvement

- Modules are versioned and regularly updated.
- Documentation is maintained within the code and repository.

## License

MIT License
