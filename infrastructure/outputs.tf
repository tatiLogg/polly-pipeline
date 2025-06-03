output "lambda_function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = aws_lambda_function.polly_function.arn
}

output "api_gateway_id" {
  description = "ID of the API Gateway"
  value       = aws_api_gateway_rest_api.polly_api.id
}

output "s3_folder_uri" {
  description = "S3 folder path for this environment"
  value       = "s3://${var.s3_bucket_name}/polly-audio/${var.environment}/"
}

