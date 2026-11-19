// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SplashInfoResponse _$SplashInfoResponseFromJson(Map<String, dynamic> json) =>
    _SplashInfoResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      durationSeconds: (json['duration_seconds'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SplashInfoResponseToJson(_SplashInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'duration_seconds': instance.durationSeconds,
      'is_active': instance.isActive,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
