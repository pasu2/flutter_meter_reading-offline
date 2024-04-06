/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_calendar.svg
  SvgGenImage get icCalendar =>
      const SvgGenImage('assets/icons/ic_calendar.svg');

  /// File path: assets/icons/ic_camera.svg
  SvgGenImage get icCamera => const SvgGenImage('assets/icons/ic_camera.svg');

  /// File path: assets/icons/ic_decrease_btn.svg
  SvgGenImage get icDecreaseBtn =>
      const SvgGenImage('assets/icons/ic_decrease_btn.svg');

  /// File path: assets/icons/ic_document.svg
  SvgGenImage get icDocument =>
      const SvgGenImage('assets/icons/ic_document.svg');

  /// File path: assets/icons/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic_home.svg');

  /// File path: assets/icons/ic_increase_btn.svg
  SvgGenImage get icIncreaseBtn =>
      const SvgGenImage('assets/icons/ic_increase_btn.svg');

  /// File path: assets/icons/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/icons/ic_search.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icCalendar,
        icCamera,
        icDecreaseBtn,
        icDocument,
        icHome,
        icIncreaseBtn,
        icSearch
      ];
}

class $AssetsImgsGen {
  const $AssetsImgsGen();

  /// File path: assets/imgs/img_btn_back.png
  AssetGenImage get imgBtnBack =>
      const AssetGenImage('assets/imgs/img_btn_back.png');

  /// File path: assets/imgs/logo_app.png
  AssetGenImage get logoApp => const AssetGenImage('assets/imgs/logo_app.png');

  /// File path: assets/imgs/logo_banner.png
  AssetGenImage get logoBanner =>
      const AssetGenImage('assets/imgs/logo_banner.png');

  /// List of all assets
  List<AssetGenImage> get values => [imgBtnBack, logoApp, logoBanner];
}

class $AssetsTessdataGen {
  const $AssetsTessdataGen();

  /// File path: assets/tessdata/eng.traineddata
  String get eng => 'assets/tessdata/eng.traineddata';

  /// File path: assets/tessdata/hin.traineddata
  String get hin => 'assets/tessdata/hin.traineddata';

  /// List of all assets
  List<String> get values => [eng, hin];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImgsGen imgs = $AssetsImgsGen();
  static const $AssetsTessdataGen tessdata = $AssetsTessdataGen();
  static const String tessdataConfig = 'assets/tessdata_config.json';

  /// List of all assets
  static List<String> get values => [tessdataConfig];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
