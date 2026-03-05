from django.conf import settings
from rest_framework import serializers

from .models import Order

GIS_ENABLED = getattr(settings, 'GIS_ENABLED', True)
Point = None
if GIS_ENABLED:
    try:
        from django.contrib.gis.geos import Point  # type: ignore
    except Exception:
        Point = None


class PointField(serializers.Field):
    def to_representation(self, value):
        if value is None:
            return None
        return {'lat': value.y, 'lng': value.x}

    def to_internal_value(self, data):
        if data is None:
            return None
        if Point is None:
            raise serializers.ValidationError('GIS not available')
        return Point(float(data['lng']), float(data['lat']))


class LocationField(serializers.Field):
    def __init__(self, *, lat_field, lng_field, **kwargs):
        super().__init__(**kwargs)
        self.lat_field = lat_field
        self.lng_field = lng_field

    def get_attribute(self, instance):
        return instance

    def to_representation(self, instance):
        lat = getattr(instance, self.lat_field, None)
        lng = getattr(instance, self.lng_field, None)
        if lat is None or lng is None:
            return None
        return {'lat': lat, 'lng': lng}

    def to_internal_value(self, data):
        if data is None:
            return None
        if not isinstance(data, dict):
            raise serializers.ValidationError('Invalid location')
        try:
            lat = float(data['lat'])
            lng = float(data['lng'])
        except (TypeError, ValueError, KeyError):
            raise serializers.ValidationError('Invalid location')
        return {'lat': lat, 'lng': lng}


class OrderSerializer(serializers.ModelSerializer):
    if GIS_ENABLED:
        pickup_location = PointField(required=False, allow_null=True)
        delivery_location = PointField(required=False, allow_null=True)
    else:
        pickup_location = LocationField(
            lat_field='pickup_lat',
            lng_field='pickup_lng',
            required=False,
            allow_null=True,
        )
        delivery_location = LocationField(
            lat_field='delivery_lat',
            lng_field='delivery_lng',
            required=False,
            allow_null=True,
        )

    class Meta:
        model = Order
        fields = [
            'id',
            'contractor',
            'driver',
            'agent',
            'material_type',
            'quantity_m3',
            'status',
            'pickup_location',
            'delivery_location',
            'created_at',
            'updated_at',
            'delivered_at',
        ]
        read_only_fields = [
            'contractor',
            'driver',
            'agent',
            'status',
            'created_at',
            'updated_at',
            'delivered_at',
        ]

    def _apply_location(self, validated_data, prefix):
        key = f'{prefix}_location'
        if key not in validated_data:
            return
        location = validated_data.pop(key)
        if location is None:
            validated_data[f'{prefix}_lat'] = None
            validated_data[f'{prefix}_lng'] = None
            return
        validated_data[f'{prefix}_lat'] = location.get('lat')
        validated_data[f'{prefix}_lng'] = location.get('lng')

    def create(self, validated_data):
        if not GIS_ENABLED:
            self._apply_location(validated_data, 'pickup')
            self._apply_location(validated_data, 'delivery')
        return super().create(validated_data)

    def update(self, instance, validated_data):
        if not GIS_ENABLED:
            self._apply_location(validated_data, 'pickup')
            self._apply_location(validated_data, 'delivery')
        return super().update(instance, validated_data)


class OrderStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ['status']
