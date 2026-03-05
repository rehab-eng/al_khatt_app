from rest_framework import generics, status
from rest_framework.parsers import FormParser, MultiPartParser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework_simplejwt.tokens import RefreshToken

from .models import AgentProfile, ContractorProfile, DeviceToken, DriverProfile, User
from .serializers import DeviceTokenSerializer, UserProfileSerializer
from .services.firebase_storage import upload_file


class ProfileView(generics.RetrieveAPIView):
    serializer_class = UserProfileSerializer

    def get_object(self):
        return self.request.user


class OtpRequestView(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        phone = request.data.get('phone')
        if not phone:
            return Response({'detail': 'phone is required'}, status=status.HTTP_400_BAD_REQUEST)
        # TODO: Integrate Firebase Auth / SMS gateway
        return Response({'status': 'sent'})


class OtpVerifyView(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        phone = request.data.get('phone')
        code = request.data.get('code')
        if not phone or not code:
            return Response({'detail': 'phone and code required'}, status=status.HTTP_400_BAD_REQUEST)

        user, _ = User.objects.get_or_create(phone=phone)
        refresh = RefreshToken.for_user(user)
        return Response(
            {
                'user': UserProfileSerializer(user).data,
                'access': str(refresh.access_token),
                'refresh': str(refresh),
            }
        )


class DeviceTokenView(APIView):
    def post(self, request):
        serializer = DeviceTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        DeviceToken.objects.update_or_create(
            token=serializer.validated_data['token'],
            defaults={
                'user': request.user,
                'platform': serializer.validated_data.get('platform', ''),
            },
        )
        return Response({'status': 'ok'})


class ContractorLicenseUploadView(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request):
        file_obj = request.FILES.get('file')
        if not file_obj:
            return Response({'detail': 'file is required'}, status=status.HTTP_400_BAD_REQUEST)
        profile, _ = ContractorProfile.objects.get_or_create(user=request.user)
        url = upload_file(file_obj, 'licenses/contractor')
        profile.commercial_license_url = url
        profile.save(update_fields=['commercial_license_url'])
        return Response({'url': url})


class AgentLicenseUploadView(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request):
        file_obj = request.FILES.get('file')
        if not file_obj:
            return Response({'detail': 'file is required'}, status=status.HTTP_400_BAD_REQUEST)
        profile, _ = AgentProfile.objects.get_or_create(user=request.user)
        url = upload_file(file_obj, 'licenses/agent')
        profile.commercial_license_url = url
        profile.save(update_fields=['commercial_license_url'])
        return Response({'url': url})


class DriverLicenseUploadView(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request):
        file_obj = request.FILES.get('file')
        if not file_obj:
            return Response({'detail': 'file is required'}, status=status.HTTP_400_BAD_REQUEST)
        profile, _ = DriverProfile.objects.get_or_create(user=request.user)
        url = upload_file(file_obj, 'licenses/driver')
        profile.license_image_url = url
        profile.save(update_fields=['license_image_url'])
        return Response({'url': url})


class DriverPhotoUploadView(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def post(self, request):
        file_obj = request.FILES.get('file')
        if not file_obj:
            return Response({'detail': 'file is required'}, status=status.HTTP_400_BAD_REQUEST)
        profile, _ = DriverProfile.objects.get_or_create(user=request.user)
        url = upload_file(file_obj, 'drivers/photos')
        profile.driver_photo_url = url
        profile.save(update_fields=['driver_photo_url'])
        return Response({'url': url})
