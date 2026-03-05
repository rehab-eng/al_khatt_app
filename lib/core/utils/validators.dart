class Validators {
  static String? requiredField(String? value, {String label = 'هذا الحقل'}) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال $label';
    }
    return null;
  }

  static String? libyanPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    final cleaned = value.trim();
    final regex = RegExp(r'^\+218\d{9}$');
    if (!regex.hasMatch(cleaned)) {
      return 'رقم الهاتف يجب أن يبدأ بـ +218 ويتكون من 9 أرقام بعده';
    }
    return null;
  }

  static String? digitsOnly(String? value, {String label = 'الرقم'}) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال $label';
    }
    final regex = RegExp(r'^\d+$');
    if (!regex.hasMatch(value.trim())) {
      return '$label يجب أن يحتوي على أرقام فقط';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الرجاء إدخال كلمة المرور';
    }
    if (value.trim().length < 8) {
      return 'كلمة المرور يجب ألا تقل عن 8 أحرف';
    }
    return null;
  }
}
