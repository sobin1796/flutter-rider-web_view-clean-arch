abstract class FilmDurationPolicy {
  static const unrestrictedPhoneNumber = '9820755500';
  static const minimumUploadDuration = Duration(seconds: 5);
  static const maximumDuration = Duration(seconds: 59);

  static bool allowsAnyDuration(String? phoneNumber) {
    final digits = phoneNumber?.replaceAll(RegExp(r'\D'), '') ?? '';
    final normalized = digits.startsWith('977') && digits.length == 13
        ? digits.substring(3)
        : digits;
    return normalized == unrestrictedPhoneNumber;
  }

  static bool isValidTalentUploadDuration(
    Duration duration, {
    required String? phoneNumber,
  }) =>
      allowsAnyDuration(phoneNumber) ||
      (duration >= minimumUploadDuration && duration <= maximumDuration);

  static bool isValidBidFilmDuration(
    Duration duration, {
    required String? phoneNumber,
  }) => allowsAnyDuration(phoneNumber) || duration <= maximumDuration;
}
