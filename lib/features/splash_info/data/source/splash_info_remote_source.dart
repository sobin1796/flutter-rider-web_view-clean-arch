import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_endpoints.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:tukaatuexpress/features/splash_info/data/model/splash_info_response.dart';

@injectable
class SplashInfoRemoteSource {
  const SplashInfoRemoteSource(this._client);
  final DioApiClient _client;

  Future<SplashInfoResponse> fetchSplashInfo() async {
    final response = await _client.httpGet<dynamic>(
      AppEndpoints.splashInfoImageLink,
    );
    return SplashInfoResponse.fromJson(response['data']);
  }
}
