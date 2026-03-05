import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<void> requestOtp(String phone) {
    return remoteDataSource.requestOtp(phone);
  }

  @override
  Future<AuthSession> verifyOtp(String phone, String code) async {
    final payload = await remoteDataSource.verifyOtp(phone, code);
    final userMap = (payload['user'] as Map<String, dynamic>?) ?? payload;
    final access = payload['access']?.toString() ?? '';
    final refresh = payload['refresh']?.toString();
    final user = UserModel.fromMap(userMap);
    return AuthSession(user: user, accessToken: access, refreshToken: refresh);
  }

  @override
  Future<void> signOut() async {
    // TODO: Implement sign out.
  }
}
