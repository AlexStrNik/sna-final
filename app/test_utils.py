import unittest
from starlette.requests import Request
from starlette.routing import Router, Route

from .utils import url_for_query

def webhook():
    pass


class TestUtils(unittest.TestCase):
    def test_url_for_query(self):
        r = Request({
            "type": "http",
            "path": "/api/add-webhook",
            "http_version": "1.1",
            "headers": {},
            "method": "GET",
            "scheme": "https",
            "server": ("rultor.pro", 443),
        })
        r.scope['router'] = Router(routes=[Route('/api/webhook', webhook)])

        url = url_for_query(r, 'webhook', token='test')
        self.assertEqual(url, 'https://rultor.pro/api/webhook?token=test')
