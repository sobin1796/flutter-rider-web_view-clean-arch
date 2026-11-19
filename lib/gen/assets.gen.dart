// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/delivery.lottie
  String get delivery => 'assets/animations/delivery.lottie';

  /// List of all assets
  List<String> get values => [delivery];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/InterBlack.ttf
  String get interBlack => 'assets/fonts/InterBlack.ttf';

  /// File path: assets/fonts/InterBold.ttf
  String get interBold => 'assets/fonts/InterBold.ttf';

  /// File path: assets/fonts/InterExtraLight.ttf
  String get interExtraLight => 'assets/fonts/InterExtraLight.ttf';

  /// File path: assets/fonts/InterLight.ttf
  String get interLight => 'assets/fonts/InterLight.ttf';

  /// File path: assets/fonts/InterMedium.ttf
  String get interMedium => 'assets/fonts/InterMedium.ttf';

  /// File path: assets/fonts/InterRegular.ttf
  String get interRegular => 'assets/fonts/InterRegular.ttf';

  /// File path: assets/fonts/InterSemiBold.ttf
  String get interSemiBold => 'assets/fonts/InterSemiBold.ttf';

  /// File path: assets/fonts/epilogueBold.ttf
  String get epilogueBold => 'assets/fonts/epilogueBold.ttf';

  /// File path: assets/fonts/epilogueMedium.ttf
  String get epilogueMedium => 'assets/fonts/epilogueMedium.ttf';

  /// File path: assets/fonts/epilogueRegular.ttf
  String get epilogueRegular => 'assets/fonts/epilogueRegular.ttf';

  /// File path: assets/fonts/epilogueSemiBold.ttf
  String get epilogueSemiBold => 'assets/fonts/epilogueSemiBold.ttf';

  /// List of all assets
  List<String> get values => [
    interBlack,
    interBold,
    interExtraLight,
    interLight,
    interMedium,
    interRegular,
    interSemiBold,
    epilogueBold,
    epilogueMedium,
    epilogueRegular,
    epilogueSemiBold,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/approved.png
  AssetGenImage get approved =>
      const AssetGenImage('assets/images/approved.png');

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/bin.png
  AssetGenImage get bin => const AssetGenImage('assets/images/bin.png');

  /// File path: assets/images/bullet_level_one.png
  AssetGenImage get bulletLevelOne =>
      const AssetGenImage('assets/images/bullet_level_one.png');

  /// File path: assets/images/cart_bold.png
  AssetGenImage get cartBold =>
      const AssetGenImage('assets/images/cart_bold.png');

  /// File path: assets/images/delete.png
  AssetGenImage get delete => const AssetGenImage('assets/images/delete.png');

  /// File path: assets/images/dis_approve.png
  AssetGenImage get disApprove =>
      const AssetGenImage('assets/images/dis_approve.png');

  /// File path: assets/images/ex_delivery.png
  AssetGenImage get exDelivery =>
      const AssetGenImage('assets/images/ex_delivery.png');

  /// File path: assets/images/ex_pick_up.png
  AssetGenImage get exPickUp =>
      const AssetGenImage('assets/images/ex_pick_up.png');

  /// File path: assets/images/fighter_five.png
  AssetGenImage get fighterFive =>
      const AssetGenImage('assets/images/fighter_five.png');

  /// File path: assets/images/media_file.png
  AssetGenImage get mediaFile =>
      const AssetGenImage('assets/images/media_file.png');

  /// File path: assets/images/onboard_films.jpeg
  AssetGenImage get onboardFilms =>
      const AssetGenImage('assets/images/onboard_films.jpeg');

  /// File path: assets/images/saved_location_outlined.png
  AssetGenImage get savedLocationOutlined =>
      const AssetGenImage('assets/images/saved_location_outlined.png');

  /// File path: assets/images/tukaatu_main_logo.png
  AssetGenImage get tukaatuMainLogo =>
      const AssetGenImage('assets/images/tukaatu_main_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    approved,
    background,
    bin,
    bulletLevelOne,
    cartBold,
    delete,
    disApprove,
    exDelivery,
    exPickUp,
    fighterFive,
    mediaFile,
    onboardFilms,
    savedLocationOutlined,
    tukaatuMainLogo,
  ];
}

abstract final class Assets {
  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
