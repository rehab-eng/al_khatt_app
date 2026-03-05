from rest_framework import serializers

from .models import Conversation, Message


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ['id', 'conversation', 'sender', 'body', 'created_at']
        read_only_fields = ['id', 'created_at', 'sender']


class ConversationSerializer(serializers.ModelSerializer):
    title = serializers.SerializerMethodField()
    last_message = serializers.SerializerMethodField()
    last_message_at = serializers.SerializerMethodField()
    unread_count = serializers.SerializerMethodField()

    class Meta:
        model = Conversation
        fields = [
            'id',
            'participants',
            'title',
            'last_message',
            'last_message_at',
            'unread_count',
            'created_at',
        ]
        read_only_fields = ['id', 'created_at']

    def get_title(self, obj):
        request = self.context.get('request')
        if request and hasattr(request, 'user'):
            other = obj.participants.exclude(id=request.user.id).first()
            if other:
                return other.full_name or other.phone
        return 'محادثة'

    def get_last_message(self, obj):
        message = obj.messages.first()
        return message.body if message else ''

    def get_last_message_at(self, obj):
        message = obj.messages.first()
        return message.created_at if message else obj.created_at

    def get_unread_count(self, obj):
        return 0
