output "api_gateway_url" {
  description = "Invoke URL for the API Gateway."
  value       = aws_apigatewayv2_stage.default_stage.invoke_url
}

output "lambda_function_name" {
  description = "Lambda function name"
  value       = aws_lambda_function.flask_app.function_name
}

output "lambda_function_arn" {
  description = "Lambda function ARN"
  value       = aws_lambda_function.flask_app.arn
}
