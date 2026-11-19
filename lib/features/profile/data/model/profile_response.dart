import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/features/profile/domain/entity/profile_entity.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? date_of_birth,
    String? avatar,
    String? pan,
    int? followers_count,
    int? marks_count,
    int? films_count,
    String? creator_status,
    bool? is_active,
    bool? is_creator,
    String? created_at,
    @Default([]) List<dynamic> addresses,
    dynamic default_address,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

extension ProfileResponseMapper on ProfileResponse {
  ProfileEntity toEntity() => ProfileEntity(
    id: id,
    name: name,
    email: email,
    phone: phone,
    dateOfBirth: date_of_birth,
    avatar: avatar,
    pan: pan,
    followersCount: followers_count,
    marksCount: marks_count,
    filmsCount: films_count,
    creatorStatus: creator_status,
    isActive: is_active,
    isCreator: is_creator,
    createdAt: created_at,
    addresses: addresses,
    defaultAddress: default_address,
  );
}
