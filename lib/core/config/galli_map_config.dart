class GalliMapConfig {
  const GalliMapConfig._();

  static const accessToken = String.fromEnvironment(
    'NEXT_PUBLIC_GALLIMAPS_ACCESS_TOKEN',
    defaultValue: '37f918a0-deef-4d92-ac94-d98ebc4e3700',
  );
}
