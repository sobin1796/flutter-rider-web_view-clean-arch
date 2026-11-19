import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/entity/{{name.snakeCase()}}_entity.dart';

part '{{name.snakeCase()}}_response.freezed.dart';
part '{{name.snakeCase()}}_response.g.dart';

@freezed
abstract class {{name.pascalCase()}}Response with _${{name.pascalCase()}}Response {
  const factory {{name.pascalCase()}}Response() = _{{name.pascalCase()}}Response;

  factory {{name.pascalCase()}}Response.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ResponseFromJson(json);
}

extension {{name.pascalCase()}}ResponseMapper on {{name.pascalCase()}}Response {
  {{name.pascalCase()}}Entity toEntity() => const {{name.pascalCase()}}Entity();
}
