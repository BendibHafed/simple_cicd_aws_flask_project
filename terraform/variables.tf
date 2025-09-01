# --- Variables of AWS/LocalStack ---
variable "use_localstack" {
  description = "True if we deploy on LocalStack, False if on AWS"
  type        = bool
  default     = false
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-3"
}

variable "aws_access_key" {
  description = "AWS Access Key (mocked if LocalStack)"
  type        = string
  default     = ""
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS Secret Key (mocked of LocalStack)"
  type        = string
  default     = ""
  sensitive   = true
}
