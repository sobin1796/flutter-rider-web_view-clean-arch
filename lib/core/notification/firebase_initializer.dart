// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';

// class FirebaseInitializer {
//   FirebaseInitializer._();
//   static Future<void> initialize() async {
//     await Firebase.initializeApp();
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   }
// }

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   debugPrint('🔔 [FCM Background] title: ${message.notification?.title}');
//   debugPrint('🔔 [FCM Background] body: ${message.notification?.body}');
//   debugPrint('🔔 [FCM Background] data: ${message.data}');
// }
