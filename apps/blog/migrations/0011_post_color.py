# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-02-29 18:21
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0010_auto_20160229_1546'),
    ]

    operations = [
        migrations.AddField(
            model_name='post',
            name='color',
            field=models.CharField(default='#ffffff', max_length=7),
        ),
    ]
