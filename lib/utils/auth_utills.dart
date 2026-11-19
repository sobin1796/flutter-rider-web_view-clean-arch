import 'package:flutter/foundation.dart';
import 'package:tukaatuexpress/Injectable/injectable.dart';
import 'package:tukaatuexpress/core/preferences/preferences.dart';

class AuthUtils {
  AuthUtils._();

  static final ValueNotifier<int> authChange = ValueNotifier<int>(0);

  static void notifyAuthChanged() => authChange.value++;

  static Future<bool> isLoggedIn() async {
    final preferences = getIt<Preferences>();
    final token = await preferences.getString(Preference.accessToken);
    return token != null && token.isNotEmpty;
  }
}
