import '../../domain/entities/message_thread.dart';
import '../../domain/repositories/messages_repository.dart';
import '../datasources/messages_remote_datasource.dart';
import '../models/message_thread_model.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  MessagesRepositoryImpl(this.remoteDataSource);

  final MessagesRemoteDataSource remoteDataSource;

  @override
  Future<List<MessageThread>> fetchThreads() async {
    final data = await remoteDataSource.fetchThreads();
    return data.whereType<Map<String, dynamic>>().map(MessageThreadModel.fromMap).toList();
  }
}
