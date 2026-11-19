import 'package:intl/intl.dart';
import 'package:tukaatuexpress/features/common/app_validators.dart';
import 'package:tukaatuexpress/features/profile/domain/entity/profile_entity.dart';

class RewardProfileValidator {
  static String? name(String? value) {
    final required = AppValidators.required(value);
    if (required != null) return required;
    if (value!.trim().toLowerCase() == 'customer') {
      return 'Enter your full name';
    }
    return null;
  }

  static String? birthday(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Date of birth is required';
    try {
      final date = text.contains('/')
          ? DateFormat('dd/MM/yyyy').parseStrict(text)
          : DateFormat('yyyy-MM-dd').parseStrict(text.split('T').first);
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      if (date.isBefore(DateTime(1900)) || date.isAfter(today)) {
        return 'Enter a valid date of birth';
      }
    } on FormatException {
      return 'Enter a valid date of birth';
    }
    return null;
  }

  static bool isComplete(ProfileEntity? profile) =>
      profile != null &&
      (profile.avatar?.trim().isNotEmpty ?? false) &&
      name(profile.name) == null &&
      AppValidators.validateEmail(profile.email) == null &&
      birthday(profile.dateOfBirth) == null;
}
