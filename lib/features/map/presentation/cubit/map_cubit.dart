import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/features/map/presentation/cubit/map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  MapCubit() : super(const MapState());
  //  Future<bool> login({
  //   required LoginParam param,
  // }) async {
  //   final result = await remoteSource.login(param: param);
  //   return result.fold(
  //     (l) {
  //       AppUtils.showErrorSnackbar(message: l.message);
  //       return false;
  //     },
  //     (r) {
  //  return true;},
  //   );
  // }
}
