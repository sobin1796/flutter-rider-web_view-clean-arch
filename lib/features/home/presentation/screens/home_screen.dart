import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/common/app_web_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: AppWebView(
          param: AppWebViewParam(
            url: 'https://tukaatuexpress.com/login',
            title: 'Tukaatu Express',
            allowedHosts: const [
              'tukaatuexpress.com',
              'www.tukaatuexpress.com',
            ],
            wrapInScaffold: false,
          ),
        ),
      ),
    );
  }
}
