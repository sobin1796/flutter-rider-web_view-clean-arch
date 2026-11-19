import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/splash_info/data/model/splash_info_response.dart';
import 'package:tukaatuexpress/features/splash_info/data/source/splash_info_remote_source.dart';
import 'package:tukaatuexpress/features/splash_info/domain/entity/splash_info_entity.dart';
import 'package:tukaatuexpress/features/splash_info/domain/repository/splash_info_repository.dart';

@LazySingleton(as: SplashInfoRepository)
class SplashInfoRepositoryImpl implements SplashInfoRepository {
  const SplashInfoRepositoryImpl(this._remoteSource);
  final SplashInfoRemoteSource _remoteSource;

  @override
  Future<Either<AppFailure, SplashInfoEntity>> fetchSplashInfo() async {
    try {
      return right((await _remoteSource.fetchSplashInfo()).toEntity());
    } catch (error) {
      if (error is AppError) return left(AppFailure(error.message));
      if (error is ApiConnectionRefusedError) {
        return left(AppFailure(error.toHumanReadableMessage()));
      }
      return left(const AppFailure('Unable to load splash information.'));
    }
  }
}
