import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/login/domain/entity/login_credentials.dart';

abstract interface class LoginRepository {
  Future<Either<AppFailure, Unit>> login(LoginCredentials credentials);
}
