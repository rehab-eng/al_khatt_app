from django.contrib import admin

from .models import Truck


@admin.register(Truck)
class TruckAdmin(admin.ModelAdmin):
    list_display = (
        'plate_number',
        'driver',
        'vehicle_type',
        'capacity_m3',
        'is_registered_owner',
        'is_active',
    )
    search_fields = ('plate_number', 'driver__phone')
    list_filter = ('is_active',)



