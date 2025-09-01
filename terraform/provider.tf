# --- Provider AWS ---
provider "aws" {
  region                      = var.aws_region
  access_key                  = var.aws_access_key
  secret_key                  = var.aws_secret_key
  skip_credentials_validation = var.use_localstack
  skip_metadata_api_check     = var.use_localstack
  s3_use_path_style           = var.use_localstack

  dynamic "endpoints" {
    for_each = var.use_localstack ? [1] : []
    content {
      apigateway = "http://localhost:4566"
      cloudwatch = "http://localhost:4566"
      dynamodb   = "http://localhost:4566"
      iam        = "http://localhost:4566"
      lambda     = "http://localhost:4566"
      s3         = "http://localhost:4566"
      sns        = "http://localhost:4566"
      sqs        = "http://localhost:4566"
      sts        = "http://localhost:4566"
    }
  }
}
