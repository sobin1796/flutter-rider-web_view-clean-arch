import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/notifications/domain/entity/notification_entity.dart';

const _unset = Object();

class NotificationsState {
  const NotificationsState({
    this.theStates = TheStates.initial,
    this.deleteState = TheStates.initial,
    this.notifications = const [],
    this.unreadCount = 0,
    this.paginationInfo,
    this.isLoadingMore = false,
    this.isNotificationsEnabled = true,
  });

  final TheStates theStates;
  final TheStates deleteState;
  final List<NotificationEntity> notifications;
  final int unreadCount;
  final NotificationPagination? paginationInfo;
  final bool isLoadingMore;
  final bool isNotificationsEnabled;

  NotificationsState copyWith({
    TheStates? theStates,
    TheStates? deleteState,
    List<NotificationEntity>? notifications,
    int? unreadCount,
    Object? paginationInfo = _unset,
    bool? isLoadingMore,
    bool? isNotificationsEnabled,
  }) => NotificationsState(
    theStates: theStates ?? this.theStates,
    deleteState: deleteState ?? this.deleteState,
    notifications: notifications ?? this.notifications,
    unreadCount: unreadCount ?? this.unreadCount,
    paginationInfo: identical(paginationInfo, _unset)
        ? this.paginationInfo
        : paginationInfo as NotificationPagination?,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    isNotificationsEnabled:
        isNotificationsEnabled ?? this.isNotificationsEnabled,
  );
}
