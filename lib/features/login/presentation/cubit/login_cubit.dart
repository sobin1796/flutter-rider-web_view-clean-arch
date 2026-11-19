import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tukaatuexpress/features/login/presentation/cubit/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
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
