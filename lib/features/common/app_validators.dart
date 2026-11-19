import 'package:form_validator/form_validator.dart';

class AppValidators {
  static String? required(
    String? value, [
    String? errorMessage = 'This field is required',
  ]) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? pleaseSelectAnOption(
    String? value, [
    String? errorMessage = 'Please select an option',
  ]) {
    if (value == null || value.trim().isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static String? requiredPasswordLength(
    String? value, {
    String errorEmpty = 'Password is required',
    String errorTooShort = 'Password must be at least 8 characters',
    int minLength = 6,
  }) {
    if (value == null || value.isEmpty) {
      return errorEmpty;
    } else if (value.length < minLength) {
      return errorTooShort;
    }
    return null;
  }

  static String? validatePhoneNumber(
    String? value, {
    String errorMessage = 'Enter a valid phone number',
  }) {
    final digits = (value ?? '').replaceAll(RegExp(r'\D'), '');
    if (digits.length < 7 || digits.length > 15) {
      return errorMessage;
    }
    return null;
  }

  static String? match(
    String? value,
    String? matchValue, [
    String errorMessage = 'Password does not match with new password',
  ]) {
    if (value != matchValue) {
      return errorMessage;
    }
    return null;
  }

  static String? requiredInteger(
    String? value, {
    String errorEmpty = 'This field is required',
    String errorInvalid = 'Please enter a valid number',
  }) {
    if (value == null || value.trim().isEmpty) {
      return errorEmpty;
    }
    if (int.tryParse(value) == null) {
      return errorInvalid;
    }
    return null;
  }

  static String? validateEmail(
    String? value, {
    String errorEmpty = 'Email is required',
    String errorInvalid = 'Please enter a valid email address',
  }) {
    if (value == null || value.trim().isEmpty) {
      return errorEmpty;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return errorInvalid;
    }
    return null;
  }

  static String? validateOptionalEmail(
    String? value, {
    String errorInvalid = 'Please enter a valid email address',
  }) {
    final text = value?.trim();

    // ✅ allow empty (optional field)
    if (text == null || text.isEmpty) {
      return null;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(text)) {
      return errorInvalid;
    }

    return null;
  }

  static String? validateWebsite(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Website is required';
    }
    final urlToValidate = value.startsWith('http')
        ? value.trim()
        : 'https://${value.trim()}';
    final urlValidator = ValidationBuilder().url().build();
    return urlValidator(urlToValidate);
  }
}
