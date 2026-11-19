import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/home/domain/entity/home_entity.dart';

abstract interface class HomeRepository {
  Future<Either<AppFailure, HomeEntity>> fetchHome();
}
