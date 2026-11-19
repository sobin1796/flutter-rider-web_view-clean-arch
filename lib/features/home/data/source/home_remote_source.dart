import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_endpoints.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:tukaatuexpress/features/home/data/model/home_response.dart';

@injectable
class HomeRemoteSource {
  const HomeRemoteSource(this._client);

  final DioApiClient _client;

  Future<HomeResponse> fetchHome() async {
    final response = await _client.httpGet<dynamic>(
      AppEndpoints.marketplaceCustomerMe,
    );
    return HomeResponse.fromJson(response['data'] as Map<String, dynamic>);
  }
}
