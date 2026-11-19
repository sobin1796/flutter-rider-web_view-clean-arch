import 'package:flutter/material.dart';
import 'package:tukaatuexpress/core/build_variants/environment_entry_points.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // DevelopmentEntryPoint();
  ProductionEntryPoint();
}
