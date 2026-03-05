import uuid

from django.conf import settings
from django.db import models

GIS_ENABLED = getattr(settings, 'GIS_ENABLED', True)
gis_models = None
if GIS_ENABLED:
    try:
        from django.contrib.gis.db import models as gis_models
    except Exception:
        gis_models = None


class TrackingPoint(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    driver = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name='tracking_points',
    )
    if gis_models:
        location = gis_models.PointField()
    else:
        lat = models.FloatField()
        lng = models.FloatField()
    recorded_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-recorded_at']

    def __str__(self):
        return f'{self.driver_id} @ {self.recorded_at}'
