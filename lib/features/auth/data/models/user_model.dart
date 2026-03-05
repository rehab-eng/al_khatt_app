import '../../domain/entities/app_user.dart';

class UserModel extends AppUser {
  const UserModel({
    required super.id,
    required super.role,
    super.phone,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final role = switch (map['role'] as String?) {
      'driver' => UserRole.driver,
      'agent' => UserRole.agent,
      _ => UserRole.contractor,
    };
    return UserModel(
      id: map['id'] as String? ?? 'unknown',
      role: role,
      phone: map['phone'] as String?,
    );
  }
}



