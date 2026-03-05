import '../entities/message_thread.dart';

abstract class MessagesRepository {
  Future<List<MessageThread>> fetchThreads();
}
