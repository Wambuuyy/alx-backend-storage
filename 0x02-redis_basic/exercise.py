#!/usr/bin/env python3
"""
Cache module for storing data in Redis
"""

import redis
import uuid
from typing import Union

class Cache:
    def __init__(self):
      """ initialization"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """
        Store the data in Redis with a randomly generated key.
        """
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
