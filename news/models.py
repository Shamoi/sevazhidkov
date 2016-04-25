import datetime
from django.db import models


class Feed(models.Model):
    db_table = 'news_feeds'
    name = models.CharField(max_length=50)
    rss_url = models.CharField(max_length=500)


class Article(models.Model):
    db_table = 'news_articles'
    title = models.CharField(max_length=300)
    text = models.TextField()
    link = models.CharField(max_length=500)
    pub_date = models.DateTimeField(default=datetime.datetime.now)
    feed = models.ForeignKey(Feed)
