import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/enum/the_states.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({@Default(TheStates.initial) TheStates theStates}) =
      _LoginState;
}
