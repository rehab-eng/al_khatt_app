from django.contrib import admin

from .models import TrackingPoint


@admin.register(TrackingPoint)
class TrackingPointAdmin(admin.ModelAdmin):
    list_display = ('driver', 'recorded_at')
    search_fields = ('driver__phone',)
    list_filter = ('recorded_at',)



