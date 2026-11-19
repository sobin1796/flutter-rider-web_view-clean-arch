import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/splash_info/domain/entity/splash_info_entity.dart';

const _unset = Object();

class SplashInfoState {
  const SplashInfoState({
    this.theStates = TheStates.initial,
    this.splashInfoResponse,
  });

  final TheStates theStates;
  final SplashInfoEntity? splashInfoResponse;

  SplashInfoState copyWith({
    TheStates? theStates,
    Object? splashInfoResponse = _unset,
  }) => SplashInfoState(
    theStates: theStates ?? this.theStates,
    splashInfoResponse: identical(splashInfoResponse, _unset)
        ? this.splashInfoResponse
        : splashInfoResponse as SplashInfoEntity?,
  );
}
