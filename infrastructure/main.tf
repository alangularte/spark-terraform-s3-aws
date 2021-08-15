# Criar um recurso do tipo S3 com o nome 'datake' (esse nome é para referência apenas no código do Terraform)

#Cria um novo S3 na AWS
resource "aws_s3_bucket" "datalake" {
  # Parametros de configuracao do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}" #variaveis extraidas do arquivo variables.tf
  acl    = "private"                                                     #access control list

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

#Cria o arquivo emr-code/pyspark/job_spark_from_tf.py no S3 utilizando o arquivo job_spark.py como origem
resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}

provider "aws" {
  region = var.aws_region
}