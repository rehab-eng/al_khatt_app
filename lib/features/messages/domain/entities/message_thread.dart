class MessageThread {
  const MessageThread({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.lastMessageAt,
    this.unreadCount = 0,
  });

  final String id;
  final String title;
  final String lastMessage;
  final DateTime lastMessageAt;
  final int unreadCount;
}
