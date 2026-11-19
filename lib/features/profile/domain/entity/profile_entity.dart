class ProfileEntity {
  const ProfileEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.avatar,
    this.pan,
    this.followersCount,
    this.marksCount,
    this.filmsCount,
    this.creatorStatus,
    this.isActive,
    this.isCreator,
    this.createdAt,
    this.addresses = const <Object?>[],
    this.defaultAddress,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? dateOfBirth;
  final String? avatar;
  final String? pan;
  final int? followersCount;
  final int? marksCount;
  final int? filmsCount;
  final String? creatorStatus;
  final bool? isActive;
  final bool? isCreator;
  final String? createdAt;
  final List<Object?> addresses;
  final Object? defaultAddress;

  ProfileEntity copyWith({String? creatorStatus}) => ProfileEntity(
    id: id,
    name: name,
    email: email,
    phone: phone,
    dateOfBirth: dateOfBirth,
    avatar: avatar,
    pan: pan,
    followersCount: followersCount,
    marksCount: marksCount,
    filmsCount: filmsCount,
    creatorStatus: creatorStatus ?? this.creatorStatus,
    isActive: isActive,
    isCreator: isCreator,
    createdAt: createdAt,
    addresses: addresses,
    defaultAddress: defaultAddress,
  );
}
