#INSTALLATION
#Prerequisites
- Django (Tested on Django 1.9)
If you do not have Django installed use: `pip install Django`

##Linux/OSX
- Download the code from this repository.
```
git clone https://github.com/cldrn/rainmap-lite
```
- Add a cron task to execute nmaper-cronjob.py periodically. For example:
```
*/5 * * * * cd <App path> && /usr/bin/python nmaper-cronjob.py >> /var/log/nmaper.log 2>&1
```
- Run the app (Or install it):
```
python manage.py runserver 0.0.0.0:8080
```

