from fastapi import APIRouter
from fastapi.responses import HTMLResponse

AUTH_RESPONSE = """
<!DOCTYPE html>
<title>Authentication complete</title>
<p>Authentication is complete. If this does not happen automatically, please
close the window.
<script>
  window.opener.postMessage({
    'flutter-web-auth': window.location.href
  }, window.location.origin);
  window.close();
</script>
"""

router = APIRouter()

@router.get('/auth', response_class=HTMLResponse)
def auth_response():
    return AUTH_RESPONSE
