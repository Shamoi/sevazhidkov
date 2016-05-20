import feedparser

MEDIUM_RSS_URL = 'https://medium.com/feed/seva-zhidkov-posts'


def last_medium_posts(n=3):
    """Get n last posts in my profile in Medium"""
    rss_feed = feedparser.parse(MEDIUM_RSS_URL)
    posts = []
    for post in rss_feed['entries']:
        posts.append({'title': post['title'], 'link': post['link']})
    return posts[:n]

#if __name__ == '__main__':
#    print(last_medium_posts())
