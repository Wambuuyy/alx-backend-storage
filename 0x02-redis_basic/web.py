#!/usr/bin/env python3
"""
Web cache and tracker
"""

import redis
import requests
from typing import Callable

class WebCache:
    def __init__(self):
        self._redis = redis.Redis()
    
    def get_page(self, url: str) -> str:
        """
        Get the HTML content of a URL and cache it.
        """
        key = f"count:{url}"
        self._redis.incr(key)
        
        cached_data = self._redis.get(url)
        if cached_data:
            return cached_data.decode('utf-8')
        
        response = requests.get(url)
        self._redis.setex(url, 10, response.text)
        return response.text

if __name__ == "__main__":
    web_cache = WebCache()
    url = "http://slowwly.robertomurray.co.uk"
    print(web_cache.get_page(url))
