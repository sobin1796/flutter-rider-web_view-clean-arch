import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/features/notifications/domain/entity/notification_entity.dart';

part 'notifications_response.freezed.dart';
part 'notifications_response.g.dart';

int? _toInt(Object? value) {
  if (value is num) return value.toInt();
  return int.tryParse(value?.toString() ?? '');
}

String? _toString(Object? value) => value?.toString();

@freezed
abstract class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    @JsonKey(fromJson: _toInt) int? unread_count,
    List<AppNotification>? data,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    @JsonKey(fromJson: _toInt) int? id,
    String? title,
    String? body,
    String? type,
    String? target,
    String? href,
    String? what,
    String? entity,
    String? order_number,
    String? store_name,
    String? store_logo,
    String? product_image,
    String? status,
    String? entity_type,
    @JsonKey(fromJson: _toString) String? entity_id,
    bool? is_read,
    DateTime? sent_at,
    DateTime? created_at,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

extension AppNotificationMapper on AppNotification {
  NotificationEntity toEntity() => NotificationEntity(
    id: id,
    title: title,
    body: body,
    type: type,
    target: target,
    href: href,
    what: what,
    entity: entity,
    orderNumber: order_number,
    storeName: store_name,
    storeLogo: store_logo,
    productImage: product_image,
    status: status,
    entityType: entity_type,
    entityId: entity_id,
    isRead: is_read,
    sentAt: sent_at,
    createdAt: created_at,
  );
}
