import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/core/bloc_provider/bloc_provider.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/core/theme/app_theme.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => AppUtils.unfocusKeyboard(context),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) => MultiBlocProvider(
          providers: blocProviders,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme(context),
            routerConfig: AppRoutes.router,
          ),
        ),
      ),
    );
  }
}
