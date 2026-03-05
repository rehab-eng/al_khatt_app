"""
ASGI config for alkhatt project.
"""

import os

import django
from channels.auth import AuthMiddlewareStack
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application

from tracking.routing import websocket_urlpatterns

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'alkhatt.settings')

django.setup()

auth_app = AuthMiddlewareStack(URLRouter(websocket_urlpatterns))

application = ProtocolTypeRouter(
    {
        'http': get_asgi_application(),
        'websocket': auth_app,
    }
)



