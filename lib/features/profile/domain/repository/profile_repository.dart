import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/profile/domain/entity/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<Either<AppFailure, ProfileEntity>> fetchProfile();
  Future<Either<AppFailure, Unit>> deactivateAccount();
}
