import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/features/splash_info/domain/entity/splash_info_entity.dart';

part 'splash_info_response.freezed.dart';
part 'splash_info_response.g.dart';

@freezed
abstract class SplashInfoResponse with _$SplashInfoResponse {
  const factory SplashInfoResponse({
    int? id,
    String? title,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'duration_seconds') int? durationSeconds,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SplashInfoResponse;

  factory SplashInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$SplashInfoResponseFromJson(json);
}

extension SplashInfoResponseMapper on SplashInfoResponse {
  SplashInfoEntity toEntity() => SplashInfoEntity(
    id: id,
    title: title,
    imageUrl: imageUrl,
    durationSeconds: durationSeconds,
    isActive: isActive,
    updatedAt: updatedAt,
  );
}
