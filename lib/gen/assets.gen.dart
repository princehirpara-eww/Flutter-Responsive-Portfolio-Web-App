// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/behance.svg
  String get behance => 'assets/icons/behance.svg';

  /// File path: assets/icons/bloc.png
  AssetGenImage get bloc => const AssetGenImage('assets/icons/bloc.png');

  /// File path: assets/icons/check.svg
  String get check => 'assets/icons/check.svg';

  /// File path: assets/icons/dart.png
  AssetGenImage get dart => const AssetGenImage('assets/icons/dart.png');

  /// File path: assets/icons/download.svg
  String get download => 'assets/icons/download.svg';

  /// File path: assets/icons/dribble.svg
  String get dribble => 'assets/icons/dribble.svg';

  /// File path: assets/icons/firebase.png
  AssetGenImage get firebase =>
      const AssetGenImage('assets/icons/firebase.png');

  /// File path: assets/icons/flutter.png
  AssetGenImage get flutter => const AssetGenImage('assets/icons/flutter.png');

  /// File path: assets/icons/github.svg
  String get github => 'assets/icons/github.svg';

  /// File path: assets/icons/linkedin.svg
  String get linkedin => 'assets/icons/linkedin.svg';

  /// File path: assets/icons/twitter.svg
  String get twitter => 'assets/icons/twitter.svg';

  /// List of all assets
  List<dynamic> get values => [
        behance,
        bloc,
        check,
        dart,
        download,
        dribble,
        firebase,
        flutter,
        github,
        linkedin,
        twitter
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/alarm.jpg
  AssetGenImage get alarm => const AssetGenImage('assets/images/alarm.jpg');

  /// File path: assets/images/car.png
  AssetGenImage get car => const AssetGenImage('assets/images/car.png');

  /// File path: assets/images/chat.png
  AssetGenImage get chat => const AssetGenImage('assets/images/chat.png');

  /// File path: assets/images/coffee.png
  AssetGenImage get coffee => const AssetGenImage('assets/images/coffee.png');

  /// File path: assets/images/cui.png
  AssetGenImage get cui => const AssetGenImage('assets/images/cui.png');

  /// File path: assets/images/doctor.png
  AssetGenImage get doctor => const AssetGenImage('assets/images/doctor.png');

  /// File path: assets/images/home_bg_desktop_and_extra_large_screen.png
  AssetGenImage get homeBgDesktopAndExtraLargeScreen => const AssetGenImage(
      'assets/images/home_bg_desktop_and_extra_large_screen.png');

  /// File path: assets/images/home_bg_large_mobile.png
  AssetGenImage get homeBgLargeMobile =>
      const AssetGenImage('assets/images/home_bg_large_mobile.png');

  /// File path: assets/images/home_bg_mobile.png
  AssetGenImage get homeBgMobile =>
      const AssetGenImage('assets/images/home_bg_mobile.png');

  /// File path: assets/images/home_bg_tablet.png
  AssetGenImage get homeBgTablet =>
      const AssetGenImage('assets/images/home_bg_tablet.png');

  /// File path: assets/images/image.png
  AssetGenImage get image => const AssetGenImage('assets/images/image.png');

  /// File path: assets/images/player.png
  AssetGenImage get player => const AssetGenImage('assets/images/player.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/recipe.png
  AssetGenImage get recipe => const AssetGenImage('assets/images/recipe.png');

  /// File path: assets/images/resume_bg.png
  AssetGenImage get resumeBg =>
      const AssetGenImage('assets/images/resume_bg.png');

  /// File path: assets/images/task.png
  AssetGenImage get task => const AssetGenImage('assets/images/task.png');

  /// File path: assets/images/triange_icon.png
  AssetGenImage get triangeIcon =>
      const AssetGenImage('assets/images/triange_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        alarm,
        car,
        chat,
        coffee,
        cui,
        doctor,
        homeBgDesktopAndExtraLargeScreen,
        homeBgLargeMobile,
        homeBgMobile,
        homeBgTablet,
        image,
        player,
        profile,
        recipe,
        resumeBg,
        task,
        triangeIcon
      ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
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
