import 'package:flutter/foundation.dart';

enum UserRole { contractor, driver, agent }

extension UserRoleLabels on UserRole {
  String get label => switch (this) {
        UserRole.contractor => 'المقاول',
        UserRole.driver => 'السائق',
        UserRole.agent => 'الوكيل',
      };
}

@immutable
class AppUser {
  const AppUser({
    required this.id,
    required this.role,
    this.phone,
  });

  final String id;
  final UserRole role;
  final String? phone;
}
