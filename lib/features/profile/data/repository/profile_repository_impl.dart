import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/profile/data/model/profile_response.dart';
import 'package:tukaatuexpress/features/profile/data/source/profile_remote_source.dart';
import 'package:tukaatuexpress/features/profile/domain/entity/profile_entity.dart';
import 'package:tukaatuexpress/features/profile/domain/repository/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._remoteSource);
  final ProfileRemoteSource _remoteSource;

  AppFailure _failure(Object error) {
    if (error is AppError) return AppFailure(error.message);
    if (error is ApiConnectionRefusedError) {
      return AppFailure(error.toHumanReadableMessage());
    }
    return const AppFailure('Unable to complete the profile request.');
  }

  @override
  Future<Either<AppFailure, ProfileEntity>> fetchProfile() async {
    try {
      return right((await _remoteSource.fetchProfile()).toEntity());
    } catch (error) {
      return left(_failure(error));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> deactivateAccount() async {
    try {
      await _remoteSource.deactivateAccount();
      return right(unit);
    } catch (error) {
      return left(_failure(error));
    }
  }
}
