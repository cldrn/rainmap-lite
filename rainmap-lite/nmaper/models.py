from __future__ import unicode_literals
from django.db import models
from django.forms import ModelForm

SCAN_STATUS = ( ('waiting','Waiting'),('running','Running'),('finished','Finished') )

class NmapProfile(models.Model):
    alias_text = models.CharField(max_length=64)
    args_text = models.CharField(max_length=2048)
    pub_date = models.DateTimeField('date created')
    def __str__(self):
        return self.alias_text

class NmapScan(models.Model):
    target_text = models.CharField(max_length=1024)
    cmd_text = models.CharField(max_length=2048)
    email_text = models.EmailField(max_length=254)
    status_text = models.CharField(max_length=16, choices = SCAN_STATUS)
    start_date = models.DateTimeField('date started')
    end_date = models.DateTimeField('date end')
    uuid = models.CharField(max_length=32)
    def __str__(self):
        return "%s - %s" % (self.cmd_text, self.email_text)

class ScanForm(ModelForm):
    class Meta:
        model = NmapScan
        fields = ['target_text', 'email_text']

