import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/features/home/domain/entity/home_entity.dart';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

@freezed
abstract class HomeResponse with _$HomeResponse {
  const factory HomeResponse() = _HomeResponse;

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

extension HomeResponseMapper on HomeResponse {
  HomeEntity toEntity() => const HomeEntity();
}
