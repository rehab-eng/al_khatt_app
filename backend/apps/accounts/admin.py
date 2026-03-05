from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin
from django.utils.html import format_html

from .forms import UserChangeForm, UserCreationForm
from .models import AgentProfile, ContractorProfile, DriverProfile, User
from wallet.models import LedgerAccount, Wallet


class WalletInline(admin.StackedInline):
    model = Wallet
    extra = 0
    can_delete = False
    readonly_fields = ('ledger_account', 'currency', 'created_at')


class LedgerAccountInline(admin.TabularInline):
    model = LedgerAccount
    extra = 0
    fields = ('code', 'name', 'account_type', 'currency', 'is_active')
    readonly_fields = ('code', 'name', 'account_type', 'currency', 'is_active')


class ContractorProfileInline(admin.StackedInline):
    model = ContractorProfile
    extra = 0
    readonly_fields = ('license_preview',)
    fields = (
        'company_name',
        'commercial_license_number',
        'commercial_license_file',
        'commercial_license_url',
        'license_status',
        'license_preview',
        'business_domain',
        'address',
        'is_driver',
    )

    def license_preview(self, obj):
        url = None
        if obj and obj.commercial_license_file:
            url = obj.commercial_license_file.url
        elif obj and obj.commercial_license_url:
            url = obj.commercial_license_url
        if url:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height:120px;" /></a>', url, url)
        return '—'

    license_preview.short_description = 'License Preview'


class AgentProfileInline(admin.StackedInline):
    model = AgentProfile
    extra = 0
    readonly_fields = ('license_preview',)
    fields = (
        'company_name',
        'commercial_license_number',
        'commercial_license_file',
        'commercial_license_url',
        'license_status',
        'license_preview',
        'business_domain',
        'address',
    )

    def license_preview(self, obj):
        url = None
        if obj and obj.commercial_license_file:
            url = obj.commercial_license_file.url
        elif obj and obj.commercial_license_url:
            url = obj.commercial_license_url
        if url:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height:120px;" /></a>', url, url)
        return '—'

    license_preview.short_description = 'License Preview'


class DriverProfileInline(admin.StackedInline):
    model = DriverProfile
    extra = 0
    readonly_fields = ('license_preview', 'driver_photo_preview')
    fields = (
        'license_number',
        'license_image',
        'license_image_url',
        'license_status',
        'license_preview',
        'driver_photo',
        'driver_photo_url',
        'driver_photo_preview',
    )

    def license_preview(self, obj):
        url = None
        if obj and obj.license_image:
            url = obj.license_image.url
        elif obj and obj.license_image_url:
            url = obj.license_image_url
        if url:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height:120px;" /></a>', url, url)
        return '—'

    license_preview.short_description = 'License Preview'

    def driver_photo_preview(self, obj):
        url = None
        if obj and obj.driver_photo:
            url = obj.driver_photo.url
        elif obj and obj.driver_photo_url:
            url = obj.driver_photo_url
        if url:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height:120px;" /></a>', url, url)
        return '—'

    driver_photo_preview.short_description = 'Driver Photo'


@admin.register(User)
class UserAdmin(DjangoUserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = (
        'phone',
        'role',
        'wallet_balance',
        'trips_count',
        'is_active',
        'is_staff',
    )
    list_filter = ('role', 'is_active')
    search_fields = ('phone', 'full_name')
    ordering = ('-date_joined',)
    inlines = [
        WalletInline,
        LedgerAccountInline,
        ContractorProfileInline,
        AgentProfileInline,
        DriverProfileInline,
    ]

    fieldsets = (
        (None, {'fields': ('phone', 'password')}),
        ('Profile', {'fields': ('full_name', 'role', 'firebase_uid')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )

    add_fieldsets = (
        (
            None,
            {
                'classes': ('wide',),
                'fields': ('phone', 'full_name', 'role', 'password1', 'password2'),
            },
        ),
    )

    def wallet_balance(self, obj):
        if hasattr(obj, 'wallet') and obj.wallet is not None:
            return f'{obj.wallet.balance:.2f} {obj.wallet.currency}'
        return '0.00'

    wallet_balance.short_description = 'Wallet Balance'

    def trips_count(self, obj):
        from orders.models import Order

        return Order.objects.filter(driver=obj, status=Order.Status.DELIVERED).count()

    trips_count.short_description = 'Trips'


admin.site.site_header = 'Al-Khatt Control Room'
admin.site.site_title = 'Al-Khatt Admin'
admin.site.index_title = 'Operations & Finance'
admin.site.index_template = 'admin/index.html'



