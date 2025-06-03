variable "environment" {
  description = "Deployment environment (e.g., beta or prod)"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the target S3 bucket"
  type        = string
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function to trigger"
  type        = string
}

variable "s3_folder_uri" {
  description = "URI to the S3 folder"
  type        = string
}

