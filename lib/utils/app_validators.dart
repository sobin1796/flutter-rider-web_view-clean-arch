import 'package:form_validator/form_validator.dart';
import 'package:tukaatuexpress/extensions/string_extension.dart';

class AppValidators {
  static String? required(String? value) {
    if (value.isNullOrEmpty()) return 'This field is required';
    return null;
  }

  static String? match(String? value, String? matchValue) {
    if (value != matchValue) return 'Passwords do not match';
    return null;
  }

  static String? integerOnly(String? value) {
    final text = value?.trim();
    if (text == null || text.isEmpty) return 'This field is required';
    if (int.tryParse(text) == null) return 'Only integers are allowed';
    return null;
  }

  static String? requiredPasswordLength(
    String? value, {
    int minLength = 8,
  }) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  static String? strongPassword(String? value) {
    if (value == null || value.trim().isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp('[A-Z]').hasMatch(value)) {
      return 'Include at least one uppercase letter';
    }
    if (!RegExp('[0-9]').hasMatch(value)) return 'Include at least one number';
    return null;
  }

  static String? nepalPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^9[678]\d{8}$').hasMatch(value.trim())) {
      return 'Enter a valid 10-digit Nepali mobile number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateOptionalEmail(String? value) {
    final text = value?.trim();
    if (text == null || text.isEmpty) return null;
    if (!RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateWebsite(String? value) {
    if (value == null || value.trim().isEmpty) return 'Website is required';
    final url =
        value.startsWith('http') ? value.trim() : 'https://${value.trim()}';
    return ValidationBuilder().url().build()(url);
  }

  static String? bankAccount(String? value) {
    final text = value?.trim();
    if (text == null || text.isEmpty) return 'This field is required';
    if (text.length < 9) return 'Invalid account number';
    return null;
  }

  static String? panNumber(String? value) {
    final text = value?.trim();
    if (text == null || text.isEmpty) return 'This field is required';
    if (text.length < 9) return 'Enter a valid PAN number';
    return null;
  }
}
