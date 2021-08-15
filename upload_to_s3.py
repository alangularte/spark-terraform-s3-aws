import boto3
import pandas as pd

s3_client = boto3.client('s3')
s3_client.upload_file('data/MICRODADOS_ENEM_2019.csv','s3://datalake-alangularte-enem-tf','row-data/enem/MICRODADOS_ENEM_2019_new.csv')