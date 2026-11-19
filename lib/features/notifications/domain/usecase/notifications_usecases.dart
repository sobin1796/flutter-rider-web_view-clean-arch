import 'package:dartz/dartz.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/notifications/domain/entity/notification_entity.dart';
import 'package:tukaatuexpress/features/notifications/domain/repository/notifications_repository.dart';

class FetchNotifications {
  const FetchNotifications(this._repository);
  final NotificationsRepository _repository;
  Future<Either<AppFailure, NotificationPage>> call({int page = 1}) =>
      _repository.fetchNotifications(page: page);
}

class DeleteAllNotifications {
  const DeleteAllNotifications(this._repository);
  final NotificationsRepository _repository;
  Future<Either<AppFailure, Unit>> call() =>
      _repository.deleteAllNotifications();
}

class DeleteNotification {
  const DeleteNotification(this._repository);
  final NotificationsRepository _repository;
  Future<Either<AppFailure, Unit>> call(int id) =>
      _repository.deleteNotification(id);
}

class MarkNotificationRead {
  const MarkNotificationRead(this._repository);
  final NotificationsRepository _repository;
  Future<Either<AppFailure, Unit>> call(int id) => _repository.markRead(id);
}

class MarkAllNotificationsRead {
  const MarkAllNotificationsRead(this._repository);
  final NotificationsRepository _repository;
  Future<Either<AppFailure, Unit>> call() => _repository.markAllRead();
}
