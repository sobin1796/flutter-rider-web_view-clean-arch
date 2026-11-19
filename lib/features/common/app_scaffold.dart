import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButtonLocation,
    this.endDrawer,
    this.backgroundColor = AppColors.white,
    this.extendBody = false,
  });
  const AppScaffold.white({
    required this.body,
    required this.extendBody,
    super.key,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButtonLocation,
    this.endDrawer,
    this.backgroundColor,
  });
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool extendBody;
  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final effectiveBottomNavigationBar = (!isKeyboardOpen)
        ? bottomNavigationBar
        : null;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: extendBody,
        endDrawer: endDrawer,
        backgroundColor: backgroundColor,
        key: key,
        drawer: drawer,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        body: body,
        bottomNavigationBar: effectiveBottomNavigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButtonLocation: floatingActionButtonLocation,
      ),
    );
  }
}
