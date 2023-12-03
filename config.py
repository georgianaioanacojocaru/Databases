import os

# For a production app, you should use a secret key set in the environment
# The recommended way to generate a 64char secret key is to run:
# python -c 'import secrets; print(secrets.token_hex())'
SECRET_KEY = os.getenv('SECRET_KEY', 'not-set')

# When deploying, set in the environment to the PostgreSQL URL
SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL', 'postgresql://postgres:Indonezia29@localhost/adb')

#'postgresql://postgres:Indonezia29@localhost/adb'] 

SQLALCHEMY_TRACK_MODIFICATIONS = False