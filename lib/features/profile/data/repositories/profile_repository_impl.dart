import '../../domain/entities/profile_data.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_data_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.remoteDataSource);

  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<ProfileData> fetchProfile() async {
    final data = await remoteDataSource.fetchProfile();
    return ProfileDataModel.fromMap(data);
  }
}
