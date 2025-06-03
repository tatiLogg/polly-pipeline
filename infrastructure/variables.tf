variable "environment" {
  description = "Deployment environment (e.g., beta or prod)"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name of the target S3 bucket"
  type        = string
}

