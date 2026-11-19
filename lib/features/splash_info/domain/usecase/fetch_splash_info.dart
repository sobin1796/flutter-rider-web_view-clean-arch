import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/splash_info/domain/entity/splash_info_entity.dart';
import 'package:tukaatuexpress/features/splash_info/domain/repository/splash_info_repository.dart';

class FetchSplashInfo {
  const FetchSplashInfo(this._repository);
  final SplashInfoRepository _repository;
  Future<Either<AppFailure, SplashInfoEntity>> call() =>
      _repository.fetchSplashInfo();
}
