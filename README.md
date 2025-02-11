# AWS Web Server Terraform Configuration

This Terraform configuration creates a basic web server infrastructure in AWS, including:

- VPC with a public subnet
- Internet Gateway
- Route Table
- Security Group
- EC2 instance running Apache web server
- S3 bucket with blocked public access

## Prerequisites

- AWS account
- Terraform installed
- AWS credentials configured

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the planned changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform apply
```

4. When finished, destroy the infrastructure:
```bash
terraform destroy
```

## Resources Created

- VPC with CIDR block 10.0.0.0/16
- Public subnet with CIDR block 10.0.1.0/24
- Internet Gateway attached to the VPC
- Route table for the public subnet
- Security group allowing inbound HTTP (port 80) and SSH (port 22)
- EC2 instance running Apache web server
- S3 bucket with blocked public access

## Outputs

- `web_server_public_ip`: The public IP address of the EC2 instance
- `s3_bucket_name`: The name of the created S3 bucket

## Notes

- The EC2 instance uses Amazon Linux 2 AMI
- The web server is automatically installed and started using user data
- The S3 bucket name is generated with a random string to ensure uniqueness
- All resources are tagged for better organization