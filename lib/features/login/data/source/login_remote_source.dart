import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/dio_provider/api_response.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_endpoints.dart';

@injectable
class LoginRemoteSource {
  const LoginRemoteSource(this._client);

  final DioApiClient _client;

  Future<Either<AppError, ApiResponse<dynamic>>> fetchLoginData({
required param,
  }) async {
    try {
      final response = await _client.httpGet<dynamic>(
            AppEndpoints.login,
      );
      return right(ApiResponse(data: response));
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(InternalAppError(message: e.toString()));
      }
    }
  }
}
