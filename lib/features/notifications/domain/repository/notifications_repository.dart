import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/notifications/domain/entity/notification_entity.dart';

abstract interface class NotificationsRepository {
  Future<Either<AppFailure, NotificationPage>> fetchNotifications({
    int page = 1,
  });
  Future<Either<AppFailure, Unit>> deleteAllNotifications();
  Future<Either<AppFailure, Unit>> deleteNotification(int id);
  Future<Either<AppFailure, Unit>> markRead(int id);
  Future<Either<AppFailure, Unit>> markAllRead();
}
