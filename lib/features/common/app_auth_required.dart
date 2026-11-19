import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';
import 'package:tukaatuexpress/features/common/app_unsigned_info_tile.dart';
import 'package:tukaatuexpress/utils/auth_utills.dart';

/// Displays a login prompt until the current user is authenticated.
class AppAuthRequired extends StatefulWidget {
  const AppAuthRequired({
    required this.title,
    required this.subtitle,
    required this.child,
    this.onAuthenticated,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Future<void> Function()? onAuthenticated;

  @override
  State<AppAuthRequired> createState() => _AppAuthRequiredState();
}

class _AppAuthRequiredState extends State<AppAuthRequired> {
  bool? _authenticated;
  int _checkVersion = 0;

  @override
  void initState() {
    super.initState();
    AuthUtils.authChange.addListener(_onAuthChanged);
    _checkAuth();
  }

  void _onAuthChanged() {
    setState(() => _authenticated = null);
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final version = ++_checkVersion;
    final authenticated = await AuthUtils.isLoggedIn();
    if (!mounted || version != _checkVersion) return;
    if (authenticated) {
      await widget.onAuthenticated?.call();
      if (!mounted || version != _checkVersion) return;
    }
    setState(() => _authenticated = authenticated);
  }

  Future<void> _login() async {
    final didLogin = await context.push<bool>(AppRoutes.loginScreen);
    if (mounted && didLogin == true && _authenticated == false) {
      setState(() => _authenticated = null);
      await _checkAuth();
    }
  }

  @override
  void dispose() {
    AuthUtils.authChange.removeListener(_onAuthChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_authenticated == null) {
      return const Center(child: AppLoadingWidget.small());
    }
    if (!_authenticated!) {
      return AppUnsignedInfoTile(
        title: widget.title,
        subtitle: widget.subtitle,
        onLogin: _login,
      );
    }
    return widget.child;
  }
}
