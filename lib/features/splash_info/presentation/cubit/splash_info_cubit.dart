import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/splash_info/domain/usecase/fetch_splash_info.dart';
import 'package:tukaatuexpress/features/splash_info/presentation/cubit/splash_info_state.dart';

@injectable
class SplashInfoCubit extends Cubit<SplashInfoState> {
  SplashInfoCubit({required FetchSplashInfo fetchSplashInfo})
    : _fetchSplashInfo = fetchSplashInfo,
      super(const SplashInfoState());

  final FetchSplashInfo _fetchSplashInfo;
  Future<bool> fetchSplashInfo() async {
    emit(state.copyWith(theStates: TheStates.loading));
    final result = await _fetchSplashInfo();
    return result.fold(
      (l) {
        emit(state.copyWith(theStates: TheStates.error));

        return false;
      },
      (r) {
        emit(
          state.copyWith(splashInfoResponse: r, theStates: TheStates.success),
        );
        return true;
      },
    );
  }
}
