import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tukaatuexpress/Injectable/injectable.dart';
import 'package:tukaatuexpress/core/config/app_config.dart';
import 'package:tukaatuexpress/features/app/app_initializer.dart';
import 'package:tukaatuexpress/features/app/my_app.dart';

class AppEntryPoint {
  AppEntryPoint(AppConfiguration buildVariant) {
    envSettings = buildVariant;
    initializeStartUpDependenciesAndRun();
  }
  static AppConfiguration? envSettings;
  static Future<void> initializeStartUpDependenciesAndRun() async {
    await configuredependencies();
    await AppInitializer.init();
    runApp(const MyApp());
  }
}
