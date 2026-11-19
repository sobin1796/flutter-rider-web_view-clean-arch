import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/domain/usecase/{{name.snakeCase()}}_usecases.dart';
import 'package:tukaatuexpress/features/{{name.snakeCase()}}/presentation/cubit/{{name.snakeCase()}}_state.dart';

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit({required Fetch{{name.pascalCase()}} fetch{{name.pascalCase()}}})
    : _fetch{{name.pascalCase()}} = fetch{{name.pascalCase()}},
      super(const {{name.pascalCase()}}State());

  final Fetch{{name.pascalCase()}} _fetch{{name.pascalCase()}};

  Future<void> fetch() async {
    emit(state.copyWith(theStates: TheStates.loading));
    final result = await _fetch{{name.pascalCase()}}();

    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(theStates: TheStates.error)),
      (entity) => emit(
        state.copyWith(entity: entity, theStates: TheStates.success),
      ),
    );
  }
}
