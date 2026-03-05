from django.contrib import admin
from django.shortcuts import redirect
from django.urls import include, path
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    path('', lambda request: redirect('/admin/')),    path('admin/', admin.site.urls),
    path('api/v1/auth/token', TokenObtainPairView.as_view(), name='token-obtain'),
    path('api/v1/auth/token/refresh', TokenRefreshView.as_view(), name='token-refresh'),
    path('api/v1/', include('accounts.urls')),
    path('api/v1/', include('wallet.urls')),
    path('api/v1/', include('orders.urls')),
    path('api/v1/', include('messages.urls')),
]
