// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      date_of_birth: json['date_of_birth'] as String?,
      avatar: json['avatar'] as String?,
      pan: json['pan'] as String?,
      followers_count: (json['followers_count'] as num?)?.toInt(),
      marks_count: (json['marks_count'] as num?)?.toInt(),
      films_count: (json['films_count'] as num?)?.toInt(),
      creator_status: json['creator_status'] as String?,
      is_active: json['is_active'] as bool?,
      is_creator: json['is_creator'] as bool?,
      created_at: json['created_at'] as String?,
      addresses: json['addresses'] as List<dynamic>? ?? const [],
      default_address: json['default_address'],
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'date_of_birth': instance.date_of_birth,
      'avatar': instance.avatar,
      'pan': instance.pan,
      'followers_count': instance.followers_count,
      'marks_count': instance.marks_count,
      'films_count': instance.films_count,
      'creator_status': instance.creator_status,
      'is_active': instance.is_active,
      'is_creator': instance.is_creator,
      'created_at': instance.created_at,
      'addresses': instance.addresses,
      'default_address': instance.default_address,
    };
