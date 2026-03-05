from channels.db import database_sync_to_async
from channels.generic.websocket import AsyncJsonWebsocketConsumer
from django.conf import settings

from accounts.models import UserRole
from .models import TrackingPoint

GIS_ENABLED = getattr(settings, 'GIS_ENABLED', True)
Point = None
if GIS_ENABLED:
    try:
        from django.contrib.gis.geos import Point  # type: ignore
    except Exception:
        Point = None


class TrackingConsumer(AsyncJsonWebsocketConsumer):
    async def connect(self):
        user = self.scope.get('user')
        if not user or not user.is_authenticated or user.role != UserRole.DRIVER:
            await self.close()
            return
        await self.accept()

    async def receive_json(self, content):
        user = self.scope.get('user')
        lat = content.get('lat')
        lng = content.get('lng')
        if lat is None or lng is None:
            await self.send_json({'status': 'error', 'message': 'lat/lng required'})
            return
        await self._save_point(user, lat, lng)
        await self.send_json({'status': 'ok'})

    @database_sync_to_async
    def _save_point(self, user, lat, lng):
        if GIS_ENABLED and Point is not None:
            point = Point(float(lng), float(lat))
            return TrackingPoint.objects.create(driver=user, location=point)
        return TrackingPoint.objects.create(driver=user, lat=float(lat), lng=float(lng))
