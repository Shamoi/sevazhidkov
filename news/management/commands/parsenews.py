import time
import datetime
from dateutil import parser
import feedparser
from django.core.management.base import BaseCommand
from news.models import Feed, Article


class Command(BaseCommand):
    help = 'Worker for getting news from RSS feeds and adding it to DB'

    def handle(self, *args, **options):
        while True:
            for feed in Feed.objects.all():
                rss_articles = feedparser.parse(feed.rss_url)['entries']
                for article_data in rss_articles:
                    # If it's article with same url already exists, just pass it
                    if Article.objects.filter(link=article_data['link']).exists():
                        continue
                    published_time = parser.parse(article_data['published'])
                    article = Article(title=article_data['title'],
                                      link=article_data['link'],
                                      pub_date=published_time,
                                      feed=feed)
                    article.save()
            time.sleep(30)
