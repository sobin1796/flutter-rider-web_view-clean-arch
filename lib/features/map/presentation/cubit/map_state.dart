import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/enum/the_states.dart';

part 'map_state.freezed.dart';

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    @Default(TheStates.initial) TheStates theStates,
  }) = _MapState;
}
