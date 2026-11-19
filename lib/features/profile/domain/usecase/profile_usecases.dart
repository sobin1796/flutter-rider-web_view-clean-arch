import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/profile/domain/entity/profile_entity.dart';
import 'package:tukaatuexpress/features/profile/domain/repository/profile_repository.dart';

class FetchProfile {
  const FetchProfile(this._repository);
  final ProfileRepository _repository;
  Future<Either<AppFailure, ProfileEntity>> call() =>
      _repository.fetchProfile();
}

class DeactivateAccount {
  const DeactivateAccount(this._repository);
  final ProfileRepository _repository;
  Future<Either<AppFailure, Unit>> call() => _repository.deactivateAccount();
}
