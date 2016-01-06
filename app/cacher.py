import time


class Cacher:
    def __init__(self):
        self.cache = []

    def get(self, url):
        new_cache = []
        result = None
        for cache_item in self.cache:
            if not cache_item.check_ttl():
                continue
            new_cache.append(cache_item)
            if cache_item.url == url:
                result = cache_item.value
        self.cache = new_cache
        return result

    def add(self, url, value, ttl):
        self.cache.append(CachedItem(url, value, ttl))

class CachedItem:
    def __init__(self, url, value, ttl):
        self.url = url
        self.value = value
        self.ttl = ttl
        self.start_time = time.time()

    def check_ttl(self):
        if time.time() - self.ttl <= self.start_time:
            return True
        return False
