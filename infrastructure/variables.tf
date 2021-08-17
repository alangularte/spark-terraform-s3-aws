variable "base_bucket_name" {
  default = "datalake-alangularte-enem-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "676132584393"
}

variable "aws_region" {
  default = "us-east-2"
}

variable "lambda_function_name" {
  default = "ExecuteEMR"
}