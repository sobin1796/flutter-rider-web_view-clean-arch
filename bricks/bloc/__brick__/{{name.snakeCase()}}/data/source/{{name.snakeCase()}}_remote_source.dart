import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_endpoints.dart';
import 'package:tukaatuexpress/core/dio_provider/dio_api_client.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/data/model/{{name.snakeCase()}}_response.dart';

@injectable
class {{name.pascalCase()}}RemoteSource {
  const {{name.pascalCase()}}RemoteSource(this._client);

  final DioApiClient _client;

  Future<{{name.pascalCase()}}Response> fetch{{name.pascalCase()}}() async {
    final response = await _client.httpGet<dynamic>(
      AppEndpoints.{{endpoint}},
    );
    return {{name.pascalCase()}}Response.fromJson(
      response['data'] as Map<String, dynamic>,
    );
  }
}
