import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/home/domain/entity/home_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(TheStates.initial) TheStates theStates,
    HomeEntity? entity,
  }) = _HomeState;
}
