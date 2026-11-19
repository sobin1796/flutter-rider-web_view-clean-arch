import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/login/domain/entity/login_credentials.dart';
import 'package:tukaatuexpress/features/login/domain/repository/login_repository.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl();

  @override
  Future<Either<AppFailure, Unit>> login(LoginCredentials credentials) async {
    return left(
      const AppFailure(
        'The phone-and-password login API is not connected yet.',
      ),
    );
  }
}
