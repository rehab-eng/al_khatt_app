from rest_framework import serializers

from orders.models import Order
from wallet.models import Wallet

from .models import AgentProfile, ContractorProfile, DeviceToken, DriverProfile, User


class ContractorProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = ContractorProfile
        fields = [
            'company_name',
            'commercial_license_number',
            'commercial_license_file',
            'commercial_license_url',
            'business_domain',
            'address',
            'is_driver',
            'license_status',
        ]


class AgentProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = AgentProfile
        fields = [
            'company_name',
            'commercial_license_number',
            'commercial_license_file',
            'commercial_license_url',
            'business_domain',
            'address',
            'license_status',
        ]


class DriverProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = DriverProfile
        fields = [
            'license_number',
            'license_image',
            'license_image_url',
            'driver_photo',
            'driver_photo_url',
            'license_status',
        ]


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'phone', 'full_name', 'role', 'date_joined']


class UserProfileSerializer(serializers.ModelSerializer):
    contractor_profile = ContractorProfileSerializer(read_only=True)
    agent_profile = AgentProfileSerializer(read_only=True)
    driver_profile = DriverProfileSerializer(read_only=True)
    wallet_balance = serializers.SerializerMethodField()
    wallet_currency = serializers.SerializerMethodField()
    trips_count = serializers.SerializerMethodField()
    primary_truck_plate = serializers.SerializerMethodField()
    vehicle_type = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = [
            'id',
            'phone',
            'full_name',
            'role',
            'date_joined',
            'wallet_balance',
            'wallet_currency',
            'trips_count',
            'primary_truck_plate',
            'vehicle_type',
            'contractor_profile',
            'agent_profile',
            'driver_profile',
        ]

    def get_wallet_balance(self, obj):
        wallet = getattr(obj, 'wallet', None)
        if not isinstance(wallet, Wallet):
            return 0
        return wallet.balance

    def get_wallet_currency(self, obj):
        wallet = getattr(obj, 'wallet', None)
        if not isinstance(wallet, Wallet):
            return 'LYD'
        return wallet.currency

    def get_trips_count(self, obj):
        return Order.objects.filter(driver=obj, status=Order.Status.DELIVERED).count()

    def get_primary_truck_plate(self, obj):
        from fleet.models import Truck

        truck = Truck.objects.filter(driver=obj, is_active=True).order_by('id').first()
        return truck.plate_number if truck else None

    def get_vehicle_type(self, obj):
        from fleet.models import Truck

        truck = Truck.objects.filter(driver=obj, is_active=True).order_by('id').first()
        return truck.vehicle_type if truck else None


class DeviceTokenSerializer(serializers.ModelSerializer):
    class Meta:
        model = DeviceToken
        fields = ['token', 'platform']
