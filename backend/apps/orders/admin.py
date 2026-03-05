from django.contrib import admin

from .models import Order


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'material_type', 'quantity_m3', 'status', 'contractor', 'driver', 'created_at')
    list_filter = ('status', 'material_type')
    search_fields = ('id', 'contractor__phone', 'driver__phone')
    readonly_fields = ('created_at', 'updated_at')



