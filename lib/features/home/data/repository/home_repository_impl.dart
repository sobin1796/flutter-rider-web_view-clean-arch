import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/home/data/model/home_response.dart';
import 'package:tukaatuexpress/features/home/data/source/home_remote_source.dart';
import 'package:tukaatuexpress/features/home/domain/entity/home_entity.dart';
import 'package:tukaatuexpress/features/home/domain/repository/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._remoteSource);

  final HomeRemoteSource _remoteSource;

  AppFailure _failure(Object error) {
    if (error is AppError) return AppFailure(error.message);
    if (error is ApiConnectionRefusedError) {
      return AppFailure(error.toHumanReadableMessage());
    }
    return const AppFailure('Unable to complete the home request.');
  }

  @override
  Future<Either<AppFailure, HomeEntity>> fetchHome() async {
    try {
      final response = await _remoteSource.fetchHome();
      return right(response.toEntity());
    } catch (error) {
      return left(_failure(error));
    }
  }
}
