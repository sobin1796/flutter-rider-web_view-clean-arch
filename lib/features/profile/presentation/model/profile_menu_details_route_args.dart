enum ProfileMenuSection { permissionAndPolicy, account }

class ProfileMenuDetailsRouteArgs {
  const ProfileMenuDetailsRouteArgs({
    required this.section,
    required this.noTokenAvailable,
    required this.onLogout,
  });

  final ProfileMenuSection section;
  final bool noTokenAvailable;
  final void Function() onLogout;
}
