import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/login/domain/entity/login_credentials.dart';
import 'package:tukaatuexpress/features/login/domain/repository/login_repository.dart';

@injectable
class LoginWithPhonePassword {
  const LoginWithPhonePassword(this._repository);

  final LoginRepository _repository;

  Future<Either<AppFailure, Unit>> call(LoginCredentials credentials) =>
      _repository.login(credentials);
}
