import '../../domain/entities/message_thread.dart';

class MessageThreadModel extends MessageThread {
  const MessageThreadModel({
    required super.id,
    required super.title,
    required super.lastMessage,
    required super.lastMessageAt,
    super.unreadCount,
  });

  factory MessageThreadModel.fromMap(Map<String, dynamic> map) {
    return MessageThreadModel(
      id: map['id']?.toString() ?? '',
      title: map['title']?.toString() ?? '-',
      lastMessage: map['last_message']?.toString() ?? '',
      lastMessageAt: DateTime.tryParse(map['last_message_at']?.toString() ?? '') ?? DateTime.now(),
      unreadCount: (map['unread_count'] as num?)?.toInt() ?? 0,
    );
  }
}
