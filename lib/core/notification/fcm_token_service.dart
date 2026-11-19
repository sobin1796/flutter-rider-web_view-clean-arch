import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tukaatuexpress/Injectable/injectable.dart';
import 'package:tukaatuexpress/core/preferences/preferences.dart';

class FcmApi {
  FcmApi._();

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          // 'https://api.fca.com.np',
          'https://api.tukaatu.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  /// Call this on app open and on token refresh.
  /// Automatically routes to authenticated or anonymous endpoint.
  static Future<bool> syncToken({required String fcmToken}) async {
    final preferences = getIt<Preferences>();
    final accessToken = await preferences.getString(Preference.accessToken);
    final isLoggedIn = await preferences.getString(Preference.isLoggedIn);
    // Include the account identity in the cache key. The same device token
    // must still be uploaded after an anonymous session becomes authenticated
    // or after a different user logs in.
    final syncKey = isLoggedIn == 'true' && accessToken != null
        ? 'authenticated:$accessToken:$fcmToken'
        : 'anonymous:$fcmToken';
    final lastSyncedKey = await preferences.getString(
      Preference.lastSyncedFcmToken,
    );
    if (lastSyncedKey == syncKey) return true;

    final didSync = isLoggedIn == 'true' && accessToken != null
        ? await saveToken(token: fcmToken, accessToken: accessToken)
        : await saveAnonymousToken(token: fcmToken);
    if (didSync) {
      await preferences.saveString(Preference.lastSyncedFcmToken, syncKey);
    }
    return didSync;
  }

  static Future<bool> saveToken({
    required String token,
    required String accessToken,
  }) async {
    try {
      await _dio.post(
        '/api/v1/marketplace/fcm-token',
        data: {'fcm_token': token},
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );
      debugPrint('✅ FCM token (authenticated) uploaded');
      return true;
    } catch (e) {
      debugPrint('FCM saveToken error: $e');
      return false;
    }
  }

  static Future<bool> saveAnonymousToken({required String token}) async {
    try {
      await _dio.post(
        '/api/v1/marketplace/fcm-token/anonymous',
        data: {'fcm_token': token},
      );
      debugPrint('✅ FCM token (anonymous) uploaded');
      return true;
    } catch (e) {
      debugPrint('FCM saveAnonymousToken error: $e');
      return false;
    }
  }
}
