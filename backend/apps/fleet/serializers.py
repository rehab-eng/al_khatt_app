from rest_framework import serializers

from .models import Truck


class TruckSerializer(serializers.ModelSerializer):
    class Meta:
        model = Truck
        fields = [
            'id',
            'driver',
            'name',
            'plate_number',
            'vehicle_type',
            'is_registered_owner',
            'registration_reason',
            'trailer_number',
            'capacity_m3',
            'max_load_tons',
            'is_active',
        ]


