# --- Variables of AWS/LocalStack ---
variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-3"
}

variable "aws_access_key" {
  description = "AWS Access Key (mocked if LocalStack)"
  type        = string
  default     = "test"
}

variable "aws_secret_key" {
  description = "AWS Secret Key (mocked of LocalStack)"
  type        = string
  default     = "test"
}

variable "use_localstack" {
  description = "True if we deploy on LocalStack, False if on AWS"
  type        = bool
  default     = false
}