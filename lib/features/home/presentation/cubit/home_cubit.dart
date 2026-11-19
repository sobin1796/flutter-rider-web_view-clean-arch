import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/home/domain/usecase/home_usecases.dart';
import 'package:tukaatuexpress/features/home/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required FetchHome fetchHome})
    : _fetchHome = fetchHome,
      super(const HomeState());
  final FetchHome _fetchHome;

  Future<void> fetch() async {
    emit(state.copyWith(theStates: TheStates.loading));
    final result = await _fetchHome();

    if (isClosed) return;
    result.fold(
      (_) => emit(state.copyWith(theStates: TheStates.error)),
      (entity) =>
          emit(state.copyWith(entity: entity, theStates: TheStates.success)),
    );
  }
}
