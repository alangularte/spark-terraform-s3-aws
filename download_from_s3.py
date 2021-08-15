import boto3
import pandas as pd

s3_client = boto3.client('s3')

s3_client.download_file('s3://datalake-alangularte-enem-tf','row-data/enem/MICRODADOS_ENEM_2019.csv','data/MICRODADOS_ENEM_2019.csv')

df = pd.csv("data/MICRODADOS_ENEM_2019.csv")
print(df)