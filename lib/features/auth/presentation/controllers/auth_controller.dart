import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../../core/storage/token_storage.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthState {
  const AuthState._({
    this.user,
    this.pendingUser,
    this.selectedRole,
    this.pendingPhone,
  });

  final AppUser? user;
  final AppUser? pendingUser;
  final UserRole? selectedRole;
  final String? pendingPhone;

  bool get isAuthenticated => user != null;

  const AuthState.unauthenticated() : this._();

  AuthState.authenticated(AppUser user) : this._(user: user, selectedRole: user.role);

  AuthState copyWith({
    AppUser? user,
    AppUser? pendingUser,
    UserRole? selectedRole,
    String? pendingPhone,
  }) {
    return AuthState._(
      user: user ?? this.user,
      pendingUser: pendingUser ?? this.pendingUser,
      selectedRole: selectedRole ?? this.selectedRole,
      pendingPhone: pendingPhone ?? this.pendingPhone,
    );
  }
}

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState.unauthenticated();

  AuthRepository get _repository => ref.read(authRepositoryProvider);
  TokenStorage get _tokenStorage => ref.read(tokenStorageProvider);

  void selectRole(UserRole role) {
    state = state.copyWith(selectedRole: role);
  }

  void setPendingPhone(String phone) {
    state = state.copyWith(pendingPhone: phone);
  }

  Future<bool> requestOtp() async {
    final phone = state.pendingPhone;
    if (phone == null || phone.isEmpty) return false;
    await _repository.requestOtp(phone);
    return true;
  }

  Future<AuthSession?> verifyOtp({required String code}) async {
    final phone = state.pendingPhone;
    if (phone == null || phone.isEmpty) return null;
    final session = await _repository.verifyOtp(phone, code);
    await _tokenStorage.saveTokens(
      access: session.accessToken,
      refresh: session.refreshToken,
    );
    state = state.copyWith(
      pendingUser: session.user,
      selectedRole: session.user.role,
    );
    return session;
  }

  void completeOnboarding() {
    final pending = state.pendingUser ?? AppUser(id: 'temporary', role: state.selectedRole ?? UserRole.contractor);
    state = AuthState.authenticated(pending);
  }

  void signInAs(UserRole role) {
    state = AuthState.authenticated(AppUser(id: 'temporary', role: role));
  }

  void signOut() {
    _tokenStorage.clear();
    state = const AuthState.unauthenticated();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(dioClientProvider);
  return AuthRepositoryImpl(AuthRemoteDataSource(client));
});

final authControllerProvider = NotifierProvider<AuthController, AuthState>(AuthController.new);
