import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/splash_info/domain/entity/splash_info_entity.dart';

abstract interface class SplashInfoRepository {
  Future<Either<AppFailure, SplashInfoEntity>> fetchSplashInfo();
}
