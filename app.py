import boto3

# Criar um client para interagir com o AWS S3
s3_client = boto3.client('s3')

# Fazendo upload de arquivos para um Bucket S3
s3_client.upload_file('RAIS_VINC_PUB_SUL.txt', # Nome do arquivo a ser subido
                      'datalake-xpe-bg', # Nome do Bucket que vai receber o arquivo
                      'rais/rais_sul')

print('Fins')