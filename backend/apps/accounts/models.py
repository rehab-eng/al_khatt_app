import uuid

from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import PermissionsMixin
from django.db import models
from django.utils import timezone


class UserRole(models.TextChoices):
    CONTRACTOR = 'contractor', 'Contractor'
    DRIVER = 'driver', 'Driver'
    AGENT = 'agent', 'Agent'
    ADMIN = 'admin', 'Admin'


class UserManager(BaseUserManager):
    def create_user(self, phone, password=None, **extra_fields):
        if not phone:
            raise ValueError('Phone number is required')
        phone = phone.strip()
        user = self.model(phone=phone, **extra_fields)
        if password:
            user.set_password(password)
        else:
            user.set_unusable_password()
        user.save(using=self._db)
        return user

    def create_superuser(self, phone, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('role', UserRole.ADMIN)
        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        return self.create_user(phone, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    phone = models.CharField(max_length=20, unique=True)
    full_name = models.CharField(max_length=120, blank=True)
    role = models.CharField(
        max_length=20,
        choices=UserRole.choices,
        default=UserRole.CONTRACTOR,
    )
    firebase_uid = models.CharField(max_length=128, blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)

    objects = UserManager()

    USERNAME_FIELD = 'phone'
    REQUIRED_FIELDS = []

    def __str__(self):
        return f'{self.phone} ({self.get_role_display()})'


class DocumentStatus(models.TextChoices):
    PENDING = 'pending', 'Pending'
    APPROVED = 'approved', 'Approved'
    REJECTED = 'rejected', 'Rejected'


class ContractorProfile(models.Model):
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name='contractor_profile',
    )
    company_name = models.CharField(max_length=160)
    commercial_license_number = models.CharField(max_length=60)
    commercial_license_file = models.FileField(
        upload_to='licenses/contractor/',
        null=True,
        blank=True,
    )
    commercial_license_url = models.URLField(blank=True)
    business_domain = models.CharField(max_length=120, blank=True)
    address = models.CharField(max_length=200, blank=True)
    is_driver = models.BooleanField(default=False)
    license_status = models.CharField(
        max_length=20,
        choices=DocumentStatus.choices,
        default=DocumentStatus.PENDING,
    )

    def __str__(self):
        return f'ContractorProfile {self.user_id}'


class AgentProfile(models.Model):
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name='agent_profile',
    )
    company_name = models.CharField(max_length=160)
    commercial_license_number = models.CharField(max_length=60)
    commercial_license_file = models.FileField(
        upload_to='licenses/agent/',
        null=True,
        blank=True,
    )
    commercial_license_url = models.URLField(blank=True)
    business_domain = models.CharField(max_length=120, blank=True)
    address = models.CharField(max_length=200, blank=True)
    license_status = models.CharField(
        max_length=20,
        choices=DocumentStatus.choices,
        default=DocumentStatus.PENDING,
    )

    def __str__(self):
        return f'AgentProfile {self.user_id}'


class DriverProfile(models.Model):
    user = models.OneToOneField(
        User,
        on_delete=models.CASCADE,
        related_name='driver_profile',
    )
    license_number = models.CharField(max_length=60)
    license_image = models.FileField(
        upload_to='licenses/driver/',
        null=True,
        blank=True,
    )
    license_image_url = models.URLField(blank=True)
    driver_photo = models.FileField(
        upload_to='drivers/photos/',
        null=True,
        blank=True,
    )
    driver_photo_url = models.URLField(blank=True)
    license_status = models.CharField(
        max_length=20,
        choices=DocumentStatus.choices,
        default=DocumentStatus.PENDING,
    )

    def __str__(self):
        return f'DriverProfile {self.user_id}'


class DeviceToken(models.Model):
    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='device_tokens',
    )
    token = models.CharField(max_length=256, unique=True)
    platform = models.CharField(max_length=20, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user_id} - {self.platform}'
