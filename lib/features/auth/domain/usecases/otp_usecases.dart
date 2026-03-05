import '../entities/auth_session.dart';
import '../repositories/auth_repository.dart';

class RequestOtp {
  RequestOtp(this.repository);
  final AuthRepository repository;

  Future<void> call(String phone) {
    return repository.requestOtp(phone);
  }
}

class VerifyOtp {
  VerifyOtp(this.repository);
  final AuthRepository repository;

  Future<AuthSession> call(String phone, String code) {
    return repository.verifyOtp(phone, code);
  }
}
