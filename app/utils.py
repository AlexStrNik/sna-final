import urllib
from starlette.requests import Request

def url_for_query(request: Request, name: str, **params: str) -> str:
    url = request.url_for(name)
    parsed = list(urllib.parse.urlparse(url))
    parsed[4] = urllib.parse.urlencode(params)
    return urllib.parse.urlunparse(parsed)
