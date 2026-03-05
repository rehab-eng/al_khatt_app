import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/profile_remote_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/profile_data.dart';
import '../../domain/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return ProfileRepositoryImpl(ProfileRemoteDataSource(client));
});

final profileProvider = FutureProvider.autoDispose<ProfileData>((ref) {
  return ref.watch(profileRepositoryProvider).fetchProfile();
});
