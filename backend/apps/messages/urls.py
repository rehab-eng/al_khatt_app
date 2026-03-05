from rest_framework.routers import DefaultRouter

from .views import ConversationViewSet, MessageViewSet

router = DefaultRouter()
router.register(r'messages/threads', ConversationViewSet, basename='message-threads')
router.register(r'messages', MessageViewSet, basename='messages')

urlpatterns = router.urls
