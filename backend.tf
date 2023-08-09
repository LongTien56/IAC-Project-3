terraform {
  backend "s3" {
    bucket         = "terraform-tienll-s3-backend"
    key            = "test-project"
    region         = "ap-southeast-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::539051983169:role/Terraform-TienllS3BackendRole"
    dynamodb_table = "terraform-tienll-s3-backend"
  }
}

