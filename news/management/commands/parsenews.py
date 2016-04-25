import time
import feedparser
from django.core.management.base import BaseCommand
from news.models import Feed, Article


class Command(BaseCommand):
    help = 'Get news from RSS feeds and add it to DB'

    def handle(self, *args, **options):
        while True:
            for feed in Feed.objects.all():
                rss_articles = feedparser.parse(feed.rss_url)
            time.sleep(5)
