import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/profile/domain/entity/profile_entity.dart';

const _unset = Object();

class ProfileState {
  const ProfileState({
    this.emailNotification,
    this.pushNotification,
    this.cameraPermission,
    this.contactsPermission,
    this.microPhonePermission,
    this.photoPermission,
    this.locationServices,
    this.theStates = TheStates.initial,
    this.profileResponse,
    this.isLogout = false,
  });

  final bool? emailNotification;
  final bool? pushNotification;
  final bool? cameraPermission;
  final bool? contactsPermission;
  final bool? microPhonePermission;
  final bool? photoPermission;
  final bool? locationServices;
  final TheStates theStates;
  final ProfileEntity? profileResponse;
  final bool isLogout;

  ProfileState copyWith({
    bool? emailNotification,
    bool? pushNotification,
    bool? cameraPermission,
    bool? contactsPermission,
    bool? microPhonePermission,
    bool? photoPermission,
    bool? locationServices,
    TheStates? theStates,
    Object? profileResponse = _unset,
    bool? isLogout,
  }) => ProfileState(
    emailNotification: emailNotification ?? this.emailNotification,
    pushNotification: pushNotification ?? this.pushNotification,
    cameraPermission: cameraPermission ?? this.cameraPermission,
    contactsPermission: contactsPermission ?? this.contactsPermission,
    microPhonePermission: microPhonePermission ?? this.microPhonePermission,
    photoPermission: photoPermission ?? this.photoPermission,
    locationServices: locationServices ?? this.locationServices,
    theStates: theStates ?? this.theStates,
    profileResponse: identical(profileResponse, _unset)
        ? this.profileResponse
        : profileResponse as ProfileEntity?,
    isLogout: isLogout ?? this.isLogout,
  );
}
