import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/profile/domain/usecase/profile_usecases.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_state.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';

@singleton
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required FetchProfile fetchProfile,
    required DeactivateAccount deactivateAccount,
  }) : _fetchProfile = fetchProfile,
       _deactivateAccount = deactivateAccount,
       super(const ProfileState());

  final FetchProfile _fetchProfile;
  final DeactivateAccount _deactivateAccount;
  int _profileRequestVersion = 0;

  Future<bool> fetchProfile() async {
    final requestVersion = ++_profileRequestVersion;
    emit(state.copyWith(theStates: TheStates.loading));
    final result = await _fetchProfile();
    if (isClosed || requestVersion != _profileRequestVersion) return false;
    return result.fold(
      (l) {
        emit(state.copyWith(theStates: TheStates.error));
        return false;
      },
      (r) {
        emit(
          state.copyWith(
            profileResponse: r,
            theStates: TheStates.success,
            isLogout: false,
          ),
        );
        return true;
      },
    );
  }

  void updateNotificationAndPermissionSettings({
    bool? emailNotification,
    bool? pushNotification,
    bool? cameraPermission,
    bool? contactsPermission,
    bool? microPhonePermission,
    bool? photoPermission,
    bool? locationServices,
  }) {
    emit(
      state.copyWith(
        emailNotification: emailNotification ?? state.emailNotification,
        pushNotification: pushNotification ?? state.pushNotification,
        cameraPermission: cameraPermission ?? state.cameraPermission,
        contactsPermission: contactsPermission ?? state.contactsPermission,
        microPhonePermission:
            microPhonePermission ?? state.microPhonePermission,
        photoPermission: photoPermission ?? state.photoPermission,
        locationServices: locationServices ?? state.locationServices,
      ),
    );
  }

  void enableLogout() {
    _profileRequestVersion++;
    emit(
      state.copyWith(
        isLogout: true,
        profileResponse: null,
        theStates: TheStates.initial,
      ),
    );
  }

  void updateCreatorStatus() {
    emit(
      state.copyWith(
        profileResponse: state.profileResponse?.copyWith(
          creatorStatus: 'pending',
        ),
      ),
    );
  }

  void resetLogout() {
    _profileRequestVersion++;
    emit(state.copyWith(isLogout: false, profileResponse: null));
  }

  Future<bool> deactivateAccount() async {
    final result = await _deactivateAccount();
    return result.fold((l) {
      AppUtils.showErrorSnackbar(message: l.message);
      return false;
    }, (r) => true);
  }
}
