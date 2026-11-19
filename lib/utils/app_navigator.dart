import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class AppNavigator {
  /// PUSH NEW SCREEN
  static Future<T?> push<T>(
    BuildContext context, {
    required Widget screen,
    bool withNavBar = false,
  }) {
    return PersistentNavBarNavigator.pushNewScreen<T>(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  /// PUSH WITH ANIMATION
  static Future<T?> pushAnimated<T>(
    BuildContext context, {
    required Widget screen,
    bool withNavBar = false,
    PageTransitionAnimation animation = PageTransitionAnimation.cupertino,
  }) {
    return PersistentNavBarNavigator.pushNewScreen<T>(
      context,
      screen: screen,
      withNavBar: withNavBar,
      pageTransitionAnimation: animation,
    );
  }

  /// PUSH REPLACEMENT (FIXED)
  static Future<T?> pushReplacement<T>(
    BuildContext context, {
    required Widget screen,
    bool withNavBar = false,
  }) {
    return PersistentNavBarNavigator.pushNewScreen<T>(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  /// PUSH WITH ROUTE SETTINGS
  static Future<T?> pushWithSettings<T>(
    BuildContext context, {
    required Widget screen,
    required RouteSettings settings,
    bool withNavBar = false,
  }) {
    return PersistentNavBarNavigator.pushNewScreenWithRouteSettings<T>(
      context,
      screen: screen,
      settings: settings,
      withNavBar: withNavBar,
    );
  }

  /// POP TO FIRST TAB SCREEN
  static void popToRootOfTab(BuildContext context) {
    PersistentNavBarNavigator.popUntilFirstScreenOnSelectedTabScreen(context);
  }

  /// POP SCREEN
  static void pop(BuildContext context) {
    PersistentNavBarNavigator.pop(context);
  }

  /// POP UNTIL ROOT (normal navigator)
  static void popToRoot(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
