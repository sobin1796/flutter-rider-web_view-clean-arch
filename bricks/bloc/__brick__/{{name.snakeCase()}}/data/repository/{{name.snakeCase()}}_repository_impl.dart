import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/data/source/{{name.snakeCase()}}_remote_source.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/entity/{{name.snakeCase()}}_entity.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/repository/{{name.snakeCase()}}_repository.dart';

@LazySingleton(as: {{name.pascalCase()}}Repository)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}RepositoryImpl(this._remoteSource);

  final {{name.pascalCase()}}RemoteSource _remoteSource;

  AppFailure _failure(Object error) {
    if (error is AppError) return AppFailure(error.message);
    if (error is ApiConnectionRefusedError) {
      return AppFailure(error.toHumanReadableMessage());
    }
    return const AppFailure('Unable to complete the {{name.lowerCase()}} request.');
  }

  @override
  Future<Either<AppFailure, {{name.pascalCase()}}Entity>> fetch{{name.pascalCase()}}() async {
    try {
      final response = await _remoteSource.fetch{{name.pascalCase()}}();
      return right(response.toEntity());
    } catch (error) {
      return left(_failure(error));
    }
  }
}
