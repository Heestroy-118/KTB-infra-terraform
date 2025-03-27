terraform {
  backend "s3" {
    bucket         = "ktb-terraform-state-bucket"
    key            = "prod/terraform.tfstate" # 수정: dev -> prod
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}