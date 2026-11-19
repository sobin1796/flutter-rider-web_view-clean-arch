import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/entity/{{name.snakeCase()}}_entity.dart';

abstract interface class {{name.pascalCase()}}Repository {
  Future<Either<AppFailure, {{name.pascalCase()}}Entity>> fetch{{name.pascalCase()}}();
}
