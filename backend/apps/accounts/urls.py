from django.urls import path

from .views import (
    AgentLicenseUploadView,
    ContractorLicenseUploadView,
    DeviceTokenView,
    DriverLicenseUploadView,
    DriverPhotoUploadView,
    OtpRequestView,
    OtpVerifyView,
    ProfileView,
)

urlpatterns = [
    path('auth/me', ProfileView.as_view(), name='auth-me'),
    path('auth/otp/request', OtpRequestView.as_view(), name='auth-otp-request'),
    path('auth/otp/verify', OtpVerifyView.as_view(), name='auth-otp-verify'),
    path('auth/device-token', DeviceTokenView.as_view(), name='device-token'),
    path('profile/contractor/license', ContractorLicenseUploadView.as_view(), name='contractor-license'),
    path('profile/agent/license', AgentLicenseUploadView.as_view(), name='agent-license'),
    path('profile/driver/license', DriverLicenseUploadView.as_view(), name='driver-license'),
    path('profile/driver/photo', DriverPhotoUploadView.as_view(), name='driver-photo'),
]
