import '../entities/auth_session.dart';

abstract class AuthRepository {
  Future<void> requestOtp(String phone);
  Future<AuthSession> verifyOtp(String phone, String code);
  Future<void> signOut();
}
