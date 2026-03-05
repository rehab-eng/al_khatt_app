import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/messages_remote_datasource.dart';
import '../../data/repositories/messages_repository_impl.dart';
import '../../domain/entities/message_thread.dart';
import '../../domain/repositories/messages_repository.dart';

final messagesRepositoryProvider = Provider<MessagesRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return MessagesRepositoryImpl(MessagesRemoteDataSource(client));
});

final messageThreadsProvider = FutureProvider.autoDispose<List<MessageThread>>((ref) {
  return ref.watch(messagesRepositoryProvider).fetchThreads();
});
