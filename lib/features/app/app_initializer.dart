import 'dart:async';
import 'dart:io';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:geolocator/geolocator.dart';

class AppInitializer {
  static final AppLinks _appLinks = AppLinks();
  static int? pendingDeepLinkProductId;
  static int? pendingDeepLinkFilmId;
  static int? pendingDeepLinkTalentFilmId;
  static int? pendingDeepLinkStoreId;
  static int? pendingDeepLinkCreatorId;
  static bool pendingDeepLinkCreatorIsUser = false;
  static String? pendingNotificationCategorySlug;
  static String? pendingNotificationUrl;
  static bool hasDeepLink = false;
  static int? pendingChatConversationId;
  static String? pendingChatConversationType;
  static int? pendingBidCampaignId;
  static int? pendingOrderId;
  static int? pendingSuspendedFilmId;
  static String? pendingSuspendedFilmReason;
  static Uri? _initialUri;

  static StreamSubscription<Uri>? _linkSubscription;
  static Future<void> init() async {
    // await FirebaseInitializer.initialize();

    await _requestLocationPermission();

    if (Platform.isAndroid) {
      unawaited(_setHighRefreshRate());
    }
    unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    );

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // app link
    await _initDeepLinks();
  }

  // for location service
  static Future<void> _requestLocationPermission() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      debugPrint('Location permission: $permission');
    } catch (error) {
      debugPrint('Location permission error: $error');
    }
  }

  static Future<void> _initDeepLinks() async {}

  static Future<void> handleUriLink(Uri uri) async {}
  static Future<void> _setHighRefreshRate() async {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // static Widget injectDependencies(Widget app) {
  //   return MultiRepositoryProvider(
  //     providers: [
  //       RepositoryProvider<Preferences>(
  //         create: (_) => preferences,
  //       ),
  //       RepositoryProvider<Dio>(
  //         create: (_) => Dio(),
  //       ),
  //       RepositoryProvider<EnvironmentHelper>(
  //         create: (_) => EnvironmentHelper(),
  //       ),
  //       RepositoryProvider<DioApiClient>(
  //         create: (context) => DioApiClient(
  //           context.read<Dio>(),
  //           context.read<EnvironmentHelper>(),
  //           context.read<Preferences>(),
  //           Dio(),
  //         ),
  //       ),
  //     ],
  //     child: app,
  //   );
  // }
}
