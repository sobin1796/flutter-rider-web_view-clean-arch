import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/entity/{{name.snakeCase()}}_entity.dart';

part '{{name.snakeCase()}}_state.freezed.dart';

@freezed
abstract class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State({
    @Default(TheStates.initial) TheStates theStates,
    {{name.pascalCase()}}Entity? entity,
  }) = _{{name.pascalCase()}}State;
}
