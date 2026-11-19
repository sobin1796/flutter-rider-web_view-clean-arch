import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_endpoints.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:tukaatuexpress/features/profile/data/model/profile_response.dart';

@injectable
class ProfileRemoteSource {
  const ProfileRemoteSource(this._client);
  final DioApiClient _client;

  Future<ProfileResponse> fetchProfile() async {
    final response = await _client.httpGet<dynamic>(
      AppEndpoints.marketplaceCustomerMe,
    );
    return ProfileResponse.fromJson(response['data']);
  }

  Future<void> deactivateAccount() async {
    await _client.post<dynamic>(AppEndpoints.marketplaceCustomerDeactivate);
  }
}
