from django.conf import settings
from rest_framework import serializers

from .models import TrackingPoint

GIS_ENABLED = getattr(settings, 'GIS_ENABLED', True)
Point = None
if GIS_ENABLED:
    try:
        from django.contrib.gis.geos import Point  # type: ignore
    except Exception:
        Point = None


class TrackingPointSerializer(serializers.ModelSerializer):
    lat = serializers.FloatField(write_only=True, required=False)
    lng = serializers.FloatField(write_only=True, required=False)
    location = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = TrackingPoint
        fields = ['id', 'driver', 'lat', 'lng', 'location', 'recorded_at']
        read_only_fields = ['recorded_at']

    def get_location(self, obj):
        if GIS_ENABLED and hasattr(obj, 'location') and obj.location is not None:
            return {'lat': obj.location.y, 'lng': obj.location.x}
        lat = getattr(obj, 'lat', None)
        lng = getattr(obj, 'lng', None)
        if lat is None or lng is None:
            return None
        return {'lat': lat, 'lng': lng}

    def validate(self, attrs):
        lat = attrs.pop('lat', None)
        lng = attrs.pop('lng', None)
        if lat is None or lng is None:
            return attrs
        if GIS_ENABLED and Point is not None:
            attrs['location'] = Point(float(lng), float(lat))
        else:
            attrs['lat'] = float(lat)
            attrs['lng'] = float(lng)
        return attrs
