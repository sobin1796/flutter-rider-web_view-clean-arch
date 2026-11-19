import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/Injectable/injectable.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configuredependencies() async => getIt.init();
