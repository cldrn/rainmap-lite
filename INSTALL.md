INSTALLATION

1. Download the code from this repository.
2. Add a cron task to execute nmaper-cronjob.py periodically. For example: * * * * cd <App path> && /usr/bin/python nmaper-cronjob.py >> /var/log/nmaper.log 2>&1
3. Run the app:
python manage.py runserver 0.0.0.0:8080

PREREQUISITES
* Django (Tested on Django 1.9)
If you do not have Django installed use: pip install Django
