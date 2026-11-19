import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/home/domain/entity/home_entity.dart';
import 'package:tukaatuexpress/features/home/domain/repository/home_repository.dart';

@injectable
class FetchHome {
  const FetchHome(this._repository);

  final HomeRepository _repository;

  Future<Either<AppFailure, HomeEntity>> call() =>
      _repository.fetchHome();
}
