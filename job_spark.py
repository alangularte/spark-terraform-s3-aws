from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("EnemSpark")
    .getOrCreate()
)

#Ler os dados do ENEM 2019 do S3
enem = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", ";")
    .load("s3://datalake-alangularte-enem-tf/row-data/enem/")
)

#Grava no S3 como parquet
(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-alangularte-enem-tf/staging/enem")
)