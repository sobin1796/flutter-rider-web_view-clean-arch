import 'package:tukaatuexpress/core/build_variants/app_environment_enum.dart';
import 'package:tukaatuexpress/features/app/app_entry_point.dart';

class AppConstants {
  static const String errorMessage = 'An error has occured';

  static bool get _isDevelopment =>
      AppEntryPoint.envSettings?.appEnvironment == AppEnvironment.development;

  static String get reverbAppKey => _isDevelopment
      ? '18cd251d476c28d85e75cb9f6fe81f62e7cc4a46569a9a67e81a83c5f811448b'
      : '9169eb21ac82bfd7470f59bbac30a20892edd5493e29d75dc8a8679fd96337af';

  static String get reverbHost =>
      _isDevelopment ? 'api.fca.com.np' : 'api.tukaatu.com';

  static String get mediaBaseUrl => _isDevelopment
      ? 'https://s3-np1.datahub.com.np/tukaatu-dev/'
      : 'https://s3-np1.datahub.com.np/tukaatu/';

  static const int reverbPort = 443;
}
