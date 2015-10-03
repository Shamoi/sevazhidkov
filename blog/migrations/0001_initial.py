# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length=100)),
                ('description', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='Post',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('title', models.CharField(max_length=146)),
                ('preview_text', models.TextField()),
                ('preview_image', models.ImageField(upload_to='')),
                ('html_text', models.TextField()),
                ('markdown_text', models.TextField()),
                ('pub_date', models.DateTimeField()),
                ('category', models.ForeignKey(to='blog.Category')),
            ],
        ),
    ]
