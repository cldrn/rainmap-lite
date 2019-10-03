# rainmap-lite

Please check the [original project](https://github.com/cldrn/rainmap-lite) for more detailed information and big thanks for this great project

## Features improvement

- Compatible with Python 3 (Tested on Python 3.7.4)
- Move out the configuration from source code to environment file (use the [python-dotenv](https://github.com/theskumar/python-dotenv) library)
- Add more variables for application

## Installation

1. git clone https://github.com/ClarkChiu/rainmap-lite
2. Prepare the environment file from .env.sample
3. Rename/Copy the .env.sample to .env
4. sh setup.sh

## Environment variables (.env.sample file)

### Configuration for setup.sh

- APP_ROOT_PATH="/opt/rainmap-lite/"
- HTTP_PORT="8000"
- LOG_PATH="/var/log/nmaper.log"
- ADMIN_USER="admin"
- ADMIN_PASS="admin"
- ADMIN_EMAIL="freebooters@gmail"

### Config for namper-cronjob.py

#### Please follow the format that described in [python-dotenv](https://github.com/theskumar/python-dotenv)

- BASE_URL="http://127.0.0.1:${HTTP_PORT}"
- SMTP_USER="SMTP_USER"
- SMTP_PASS="SMTP_PASS"
- SMTP_SERVER="SMTP_SERVER"
- SMTP_PORT="SMTP_PORT"
- SMTP_DOMAIN_NAME="SMTP_DOMAIN_NAME"

## TODO:

- Support Django 2
- Integrate LDAP authentication
