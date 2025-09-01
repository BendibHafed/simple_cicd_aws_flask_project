terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-he1"
    key            = "flask-app/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }

}