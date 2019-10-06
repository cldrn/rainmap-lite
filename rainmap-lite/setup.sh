APP_ROOT_PATH=$(grep 'APP_ROOT_PATH' .env | cut -d '=' -f2 | tr -d '"')
LOG_PATH=$(grep 'LOG_PATH' .env | cut -d '=' -f2 | tr -d '"')
ADMIN_USER=$(grep 'ADMIN_USER' .env | cut -d '=' -f2 | tr -d '"')
ADMIN_PASS=$(grep 'ADMIN_PASS' .env | cut -d '=' -f2 | tr -d '"')
ADMIN_EMAIL=$(grep 'ADMIN_EMAIL' .env | cut -d '=' -f2 | tr -d '"')
HTTP_PORT=$(grep 'HTTP_PORT=' .env | cut -d '=' -f2 | tr -d '"')
IS_SETUP=$(grep 'IS_SETUP' .env | cut -d '=' -f2 | tr -d '"')

# Setup the environment on first run
if [ -z "$IS_SETUP" ]
then
    # Install the required Python libs
    pip install -r requirement.txt

    # Setup the application
    python3 manage.py migrate
    python3 manage.py loaddata nmapprofiles

    # Setup the crontab job
    crontab -l > cronjob_list.txt
    echo "*/5 * * * * cd $APP_ROOT_PATH && python3 nmaper-cronjob.py >> $LOG_PATH 2>&1" >> cronjob_list.txt
    crontab cronjob_list.txt
    rm cronjob_list.txt

    # Add the admin user
    echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('$ADMIN_USER', '$ADMIN_EMAIL', '$ADMIN_PASS')" | python3 manage.py shell
fi

# Write the config file for setup flag
echo "IS_SETUP=True" >> .env

# Start up the HTTP server
python3 manage.py runserver 0.0.0.0:$HTTP_PORT
