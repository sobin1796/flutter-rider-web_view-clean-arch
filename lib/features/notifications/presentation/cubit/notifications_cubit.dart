import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/notifications/domain/entity/notification_entity.dart';
import 'package:tukaatuexpress/features/notifications/domain/usecase/notifications_usecases.dart';
import 'package:tukaatuexpress/features/notifications/presentation/cubit/notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({
    required FetchNotifications fetchNotifications,
    required DeleteAllNotifications deleteAllNotifications,
    required DeleteNotification deleteNotification,
    required MarkNotificationRead markNotificationRead,
    required MarkAllNotificationsRead markAllNotificationsRead,
  }) : _fetchNotifications = fetchNotifications,
       _deleteAllNotifications = deleteAllNotifications,
       _deleteNotification = deleteNotification,
       _markNotificationRead = markNotificationRead,
       _markAllNotificationsRead = markAllNotificationsRead,
       super(const NotificationsState());

  final FetchNotifications _fetchNotifications;
  final DeleteAllNotifications _deleteAllNotifications;
  final DeleteNotification _deleteNotification;
  final MarkNotificationRead _markNotificationRead;
  final MarkAllNotificationsRead _markAllNotificationsRead;

  Future<void> fetchNotifications() async {
    emit(state.copyWith(theStates: TheStates.loading));
    final result = await _fetchNotifications();
    result.fold(
      (_) => emit(state.copyWith(theStates: TheStates.error)),
      (page) => emit(
        state.copyWith(
          theStates: TheStates.success,
          notifications: page.notifications,
          unreadCount: page.unreadCount,
          paginationInfo: page.pagination,
        ),
      ),
    );
  }

  Future<bool> deleteAllNotifications() async {
    final oldNotifications = state.notifications;
    emit(state.copyWith(deleteState: TheStates.loading, notifications: []));
    final result = await _deleteAllNotifications();
    return result.fold(
      (_) {
        emit(
          state.copyWith(
            deleteState: TheStates.error,
            notifications: oldNotifications,
          ),
        );
        return false;
      },
      (_) {
        emit(state.copyWith(deleteState: TheStates.success));
        return true;
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore) return;
    emit(state.copyWith(isLoadingMore: true));
    final currentPage = state.paginationInfo?.currentPage ?? 1;
    final result = await _fetchNotifications(page: currentPage + 1);
    result.fold(
      (_) => emit(state.copyWith(isLoadingMore: false)),
      (page) => emit(
        state.copyWith(
          notifications: [...state.notifications, ...page.notifications],
          unreadCount: page.unreadCount,
          paginationInfo: page.pagination,
          isLoadingMore: false,
        ),
      ),
    );
  }

  Future<void> markRead(int id) async {
    final previous = state.notifications;
    final previousUnreadCount = state.unreadCount;
    emit(
      state.copyWith(
        notifications: previous
            .map((item) => item.id == id ? item.copyWith(isRead: true) : item)
            .toList(),
        unreadCount: state.unreadCount > 0 ? state.unreadCount - 1 : 0,
      ),
    );
    final result = await _markNotificationRead(id);
    result.fold(
      (_) => emit(
        state.copyWith(
          notifications: previous,
          unreadCount: previousUnreadCount,
        ),
      ),
      (_) {},
    );
  }

  Future<void> markAllRead() async {
    final previous = state.notifications;
    final previousUnreadCount = state.unreadCount;
    emit(
      state.copyWith(
        notifications: previous
            .map((item) => item.copyWith(isRead: true))
            .toList(),
        unreadCount: 0,
      ),
    );
    final result = await _markAllNotificationsRead();
    result.fold(
      (_) => emit(
        state.copyWith(
          notifications: previous,
          unreadCount: previousUnreadCount,
        ),
      ),
      (_) {},
    );
  }

  Future<void> deleteNotification(int id) async {
    final previous = state.notifications;
    if (!previous.any((item) => item.id == id)) return;

    final oldPagination = state.paginationInfo;
    final updatedPagination = oldPagination == null
        ? null
        : NotificationPagination(
            currentPage: oldPagination.currentPage,
            lastPage: oldPagination.lastPage,
            perPage: oldPagination.perPage,
            total: ((oldPagination.total ?? 0) - 1).clamp(0, 999999),
          );
    emit(
      state.copyWith(
        notifications: previous.where((item) => item.id != id).toList(),
        paginationInfo: updatedPagination,
      ),
    );

    final result = await _deleteNotification(id);
    result.fold(
      (_) => emit(
        state.copyWith(notifications: previous, paginationInfo: oldPagination),
      ),
      (_) {},
    );
  }
}
