// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationResponse(
  unread_count: _toInt(json['unread_count']),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotificationResponseToJson(
  _NotificationResponse instance,
) => <String, dynamic>{
  'unread_count': instance.unread_count,
  'data': instance.data,
};

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: _toInt(json['id']),
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      target: json['target'] as String?,
      href: json['href'] as String?,
      what: json['what'] as String?,
      entity: json['entity'] as String?,
      order_number: json['order_number'] as String?,
      store_name: json['store_name'] as String?,
      store_logo: json['store_logo'] as String?,
      product_image: json['product_image'] as String?,
      status: json['status'] as String?,
      entity_type: json['entity_type'] as String?,
      entity_id: _toString(json['entity_id']),
      is_read: json['is_read'] as bool?,
      sent_at: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'target': instance.target,
      'href': instance.href,
      'what': instance.what,
      'entity': instance.entity,
      'order_number': instance.order_number,
      'store_name': instance.store_name,
      'store_logo': instance.store_logo,
      'product_image': instance.product_image,
      'status': instance.status,
      'entity_type': instance.entity_type,
      'entity_id': instance.entity_id,
      'is_read': instance.is_read,
      'sent_at': instance.sent_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
    };
