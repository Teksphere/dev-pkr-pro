terraform {
  backend "s3" {
    bucket         = "tek-pkr777"
    key            = "my-terraform-environment/main"
    region         = "us-east-1"
    dynamodb_table = "pkr-dynamo-db-table"
  }
}
