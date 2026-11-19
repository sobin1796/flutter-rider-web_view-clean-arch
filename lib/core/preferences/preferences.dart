import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String isFirstRun = 'isFirstRun';
  static const String productSwipeGuideShown = 'productSwipeGuideShown';
  static const String reelsSwipeGuideShown = 'reelsSwipeGuideShown';
  static const String isLoggedIn = 'isLoggedIn';
  static const String accessToken = 'ACCESS_TOKEN';
  static const String deviceToken = 'DEVICE_TOKEN';
  static const String lastSyncedFcmToken = 'LAST_SYNCED_FCM_TOKEN';
  static const String refreshToken = 'REFRESH_TOKEN';
  static const String themeMode = 'IS_DARK_MODE';
  static const String notificationsEnabled = 'NOTIFICATIONS_ENABLED';
  static const String chatSafetyAgreementAccepted =
      'CHAT_SAFETY_AGREEMENT_ACCEPTED';
  static const String festivalCriteriaAgreementAccepted =
      'FESTIVAL_CRITERIA_AGREEMENT_ACCEPTED';
}

class Preferences {
  const Preferences(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<void> saveString(String name, String value) async {
    await _sharedPreferences.setString(name.toLowerCase(), value);
  }

  Future<String?> getString(String name) async {
    return _sharedPreferences.getString(name.toLowerCase());
  }

  Future<void> deleteString(String name) async {
    await _sharedPreferences.remove(name.toLowerCase());
  }

  Future<void> saveBool(String name, {required bool value}) async {
    await _sharedPreferences.setBool(name.toLowerCase(), value);
  }

  bool getBool(String name, {bool defaultValue = true}) {
    final value = _sharedPreferences.get(name.toLowerCase());
    if (value is bool) return value;
    if (value is String) return value.toLowerCase() == 'true';
    return defaultValue;
  }

  bool contains(String name) {
    return _sharedPreferences.containsKey(name.toLowerCase());
  }
}
