extension NepaliPhoneExtension on String {
  bool get isNepaliPhoneNumber => RegExp(r'^(98|97)[0-9]{8}$').hasMatch(trim());
}
