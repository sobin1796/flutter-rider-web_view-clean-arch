import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/core/dio_provider/api_error.dart';
import 'package:tukaatuexpress/core/domain/failure/app_failure.dart';
import 'package:tukaatuexpress/features/notifications/data/model/notifications_response.dart';
import 'package:tukaatuexpress/features/notifications/data/source/notifications_remote_source.dart';
import 'package:tukaatuexpress/features/notifications/domain/entity/notification_entity.dart';
import 'package:tukaatuexpress/features/notifications/domain/repository/notifications_repository.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  const NotificationsRepositoryImpl(this._remoteSource);
  final NotificationRemoteSource _remoteSource;

  AppFailure _failure(Object error) {
    if (error is AppError) return AppFailure(error.message);
    if (error is ApiConnectionRefusedError) {
      return AppFailure(error.toHumanReadableMessage());
    }
    return const AppFailure('Unable to complete the notification request.');
  }

  @override
  Future<Either<AppFailure, NotificationPage>> fetchNotifications({
    int page = 1,
  }) async {
    try {
      final (response, unreadCount) = await _remoteSource.fetchNotifications(
        page: page,
      );
      final pagination = response.paginationInfo;
      return right(
        NotificationPage(
          notifications: (response.data ?? [])
              .map((item) => item.toEntity())
              .toList(),
          unreadCount: unreadCount,
          currentPage: pagination?.currentPage,
          lastPage: pagination?.lastPage,
          perPage: pagination?.perPage,
          total: pagination?.total,
        ),
      );
    } catch (error) {
      return left(_failure(error));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> deleteAllNotifications() =>
      _run(_remoteSource.deleteAllNotification);

  @override
  Future<Either<AppFailure, Unit>> deleteNotification(int id) =>
      _run(() => _remoteSource.deleteNotification(id));

  @override
  Future<Either<AppFailure, Unit>> markRead(int id) =>
      _run(() => _remoteSource.readNotification(id));

  @override
  Future<Either<AppFailure, Unit>> markAllRead() =>
      _run(_remoteSource.readAllNotifications);

  Future<Either<AppFailure, Unit>> _run(Future<void> Function() action) async {
    try {
      await action();
      return right(unit);
    } catch (error) {
      return left(_failure(error));
    }
  }
}
