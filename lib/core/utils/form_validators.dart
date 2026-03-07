import 'package:intl/intl.dart';

class FormValidators {
  static String? requiredField(String? value, String errorMessage) {
    if (value == null || value.isEmpty) return errorMessage;
    return null;
  }

  static String? email(
    String? value,
    String emptyMessage,
    String invalidMessage,
  ) {
    if (value == null || value.isEmpty) return emptyMessage;
    final emailRegex = RegExp(r'\S+@\S+\.\S+');
    if (!emailRegex.hasMatch(value)) return invalidMessage;
    return null;
  }

  static String? password(
    String? value,
    String emptyMessage,
    String invalidMessage, {
    int minLength = 8,
  }) {
    if (value == null || value.isEmpty) return emptyMessage;
    final pattern = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (!pattern.hasMatch(value)) return invalidMessage;

    return null;
  }

  static String? confirmPassword(
    String? password,
    String? confirmPassword,
    String message,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) return message;
    if (password != confirmPassword) return message;
    return null;
  }

  static String? birthDate(
    String? value,
    String requiredMessage,
    String invalidFormatMessage,
    String ageRestrictionMessage, {
    int minAge = 18,
  }) {
    if (value == null || value.isEmpty) return requiredMessage;

    DateTime birthDate;
    try {
      birthDate = DateFormat('yyyy-MM-dd').parseStrict(value);
    } catch (e) {
      return invalidFormatMessage;
    }

    final today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    if (age < minAge) return ageRestrictionMessage;

    return null;
  }

  static String? phone(
    String? value,
    String emptyMessage,
    String invalidMessage,
  ) {
    if (value == null || value.isEmpty) return emptyMessage;

    final pattern = RegExp(r'^01[0-2,5][0-9]{8}$');
    if (!pattern.hasMatch(value)) return invalidMessage;

    return null;
  }

  static String? nationalId(
    String? value,
    String emptyMessage,
    String invalidMessage,
  ) {
    if (value == null || value.isEmpty) return emptyMessage;

    final pattern = RegExp(r'^\d{14}$');
    if (!pattern.hasMatch(value)) return invalidMessage;

    return null;
  }

  static String? otpPhoneVerify(
    String? value,
    String emptyMessage,
    String invalidMessage,
  ) {
    if (value == null || value.isEmpty) return emptyMessage;

    final pattern = RegExp(r'^\d{4}$');
    if (!pattern.hasMatch(value)) return invalidMessage;

    return null;
  }

  static String? otpEmailVerify(
    String? value,
    String emptyMessage,
    String invalidMessage,
  ) {
    if (value == null || value.isEmpty) return emptyMessage;

    final pattern = RegExp(r'^\d{4}$');
    if (!pattern.hasMatch(value)) return invalidMessage;
    return null;
  }
}
