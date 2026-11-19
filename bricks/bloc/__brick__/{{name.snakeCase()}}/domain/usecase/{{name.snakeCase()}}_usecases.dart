import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/entity/{{name.snakeCase()}}_entity.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/repository/{{name.snakeCase()}}_repository.dart';

@injectable
class Fetch{{name.pascalCase()}} {
  const Fetch{{name.pascalCase()}}(this._repository);

  final {{name.pascalCase()}}Repository _repository;

  Future<Either<AppFailure, {{name.pascalCase()}}Entity>> call() =>
      _repository.fetch{{name.pascalCase()}}();
}
