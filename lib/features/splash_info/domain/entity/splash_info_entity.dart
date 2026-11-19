class SplashInfoEntity {
  const SplashInfoEntity({
    this.id,
    this.title,
    this.imageUrl,
    this.durationSeconds,
    this.isActive,
    this.updatedAt,
  });

  final int? id;
  final String? title;
  final String? imageUrl;
  final int? durationSeconds;
  final bool? isActive;
  final DateTime? updatedAt;
}
