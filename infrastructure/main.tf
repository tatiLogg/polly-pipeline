provider "aws" {
  region = var.aws_region
}

resource "aws_iam_role" "polly_exec" {
  name = "${var.environment}-polly-exec-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_lambda_function" "polly_function" {
  function_name = "${var.environment}_PollyTextToSpeech"
  runtime       = "python3.10"
  role          = aws_iam_role.polly_exec.arn
  handler       = "lambda_function.lambda_handler"
  filename      = "lambda.zip"
}

resource "aws_api_gateway_rest_api" "polly_api" {
  name = "${var.environment}_PollyAPI"
}

resource "aws_s3_bucket_object" "polly_audio_folder" {
  bucket  = var.s3_bucket_name
  key     = "polly-audio/${var.environment}/"
  content = "placeholder"
}

