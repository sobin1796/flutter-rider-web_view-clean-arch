import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/features/common/app_web_view.dart';
import 'package:tukaatuexpress/features/home/presentation/screens/home_screen.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/login_screen.dart';
import 'package:tukaatuexpress/features/notifications/presentation/screens/notification_screen.dart';
import 'package:tukaatuexpress/features/profile/presentation/model/profile_menu_details_route_args.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/delete_account_screen.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/profile_menu_details_screen.dart';
import 'package:tukaatuexpress/features/splash_info/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String main = '/main';
  static const String markScreen = '/markScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String appWebView = '/appWebView';

  static const String savedAddressesScreen = '/savedAddressesScreen';
  static const String couponsScreen = '/couponsScreen';
  static const String deleteAccountScreen = '/deleteAccountScreen';
  static const String monetizationDashboardScreen =
      '/monetizationDashboardScreen';
  static const String ordersScreen = '/ordersScreen';
  static const String permissionScreen = '/permissionScreen';
  static const String profileMenuDetailsScreen = '/profileMenuDetailsScreen';
  static const String userFilmSectionScreen = '/userFilmSectionScreen';
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    overridePlatformDefaultLocation: true,
    initialLocation: splash,
    routes: [
      splash.route((context, state) => const SplashScreen()),
      appWebView.route((context, state) {
        final param = state.extra! as AppWebViewParam;
        return AppWebView(param: param);
      }),
      notificationScreen.route((context, state) => const NotificationScreen()),
      profileMenuDetailsScreen.route((context, state) {
        final args = state.extra! as ProfileMenuDetailsRouteArgs;
        return ProfileMenuDetailsScreen(args: args);
      }),
      deleteAccountScreen.route(
        (context, state) => const DeleteAccountScreen(),
      ),
      loginScreen.route((context, state) => const LoginScreen()),
      homeScreen.route((context, state) => const HomeScreen()),
    ],
  );
}

extension GoRoutes on String {
  GoRoute route(Widget Function(BuildContext, GoRouterState) builder) {
    return GoRoute(path: this, name: substring(1), builder: builder);
  }
}
