import time


class Cacher:
    def __init__(self):
        self.cache = []

    def get(self, name):
        new_cache = []
        result = None
        for cache_item in self.cache:
            if not cache_item.check_ttl():
                continue
            new_cache.append(cache_item)
            if cache_item.name == name:
                result = cache_item.value
        self.cache = new_cache
        return result

    def add(self, name, value, ttl):
        self.cache.append(CachedItem(name, value, ttl))

class CachedItem:
    def __init__(self, name, value, ttl):
        self.name = name
        self.value = value
        self.ttl = ttl
        self.start_time = time.time()

    def check_ttl(self):
        if time.time() - self.ttl <= self.start_time:
            return True
        return False
