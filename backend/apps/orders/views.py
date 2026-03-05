from rest_framework import permissions, viewsets
from rest_framework.exceptions import PermissionDenied

from accounts.models import UserRole
from fleet.models import Truck

from .models import Order
from .serializers import OrderSerializer


class OrderPermission(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user.role == UserRole.CONTRACTOR


class OrderViewSet(viewsets.ModelViewSet):
    serializer_class = OrderSerializer
    permission_classes = [permissions.IsAuthenticated, OrderPermission]

    def get_queryset(self):
        user = self.request.user
        if user.role == UserRole.CONTRACTOR:
            return Order.objects.filter(contractor=user)
        if user.role == UserRole.DRIVER:
            max_capacity = (
                Truck.objects.filter(driver=user, is_active=True)
                .order_by('-capacity_m3')
                .values_list('capacity_m3', flat=True)
                .first()
            )
            if max_capacity is None:
                return Order.objects.none()
            return Order.objects.filter(
                status=Order.Status.PENDING,
                quantity_m3__lte=max_capacity,
            )
        if user.role == UserRole.AGENT:
            return Order.objects.all()
        raise PermissionDenied('Not allowed')

    def perform_create(self, serializer):
        if self.request.user.role != UserRole.CONTRACTOR:
            raise PermissionDenied('Only contractors can create orders')
        serializer.save(contractor=self.request.user)
