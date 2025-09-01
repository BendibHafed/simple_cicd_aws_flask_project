terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-he1"
    key            = "flask-app/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }

}