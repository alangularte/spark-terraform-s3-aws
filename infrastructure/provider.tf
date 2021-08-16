provider "aws" {
  region = var.aws_region
}

# Centralizar o arquivo de controle de estado do terraform
# O S3 bucket já tem que estar previamente criado (manualmente)
terraform {
  backend "s3" {
    bucket = "terraform-state-alangularte"
    key = "state/terraform.tfstate"
    region = "us-east-2"
  }
}