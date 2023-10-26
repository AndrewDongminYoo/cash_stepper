/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

// 📦 Package imports:
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Medical_ScheduleApp_0.0.png
  AssetGenImage get medicalScheduleApp00 =>
      const AssetGenImage('assets/images/Medical_ScheduleApp_0.0.png');

  /// File path: assets/images/app_launcher_icon.png
  AssetGenImage get appLauncherIcon =>
      const AssetGenImage('assets/images/app_launcher_icon.png');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/createAccount_bg@2x.png
  AssetGenImage get createAccountBg2x =>
      const AssetGenImage('assets/images/createAccount_bg@2x.png');

  /// File path: assets/images/emptyBudgets@2x.png
  AssetGenImage get emptyBudgets2x =>
      const AssetGenImage('assets/images/emptyBudgets@2x.png');

  /// File path: assets/images/finWallet_logo_landscape.png
  AssetGenImage get finWalletLogoLandscape =>
      const AssetGenImage('assets/images/finWallet_logo_landscape.png');

  /// File path: assets/images/finWallet_logo_landscapeDark@3x.png
  AssetGenImage get finWalletLogoLandscapeDark3x =>
      const AssetGenImage('assets/images/finWallet_logo_landscapeDark@3x.png');

  /// File path: assets/images/fin_budgetRemove@2x.png
  AssetGenImage get finBudgetRemove2x =>
      const AssetGenImage('assets/images/fin_budgetRemove@2x.png');

  /// File path: assets/images/fin_onboarding_1@2x.png
  AssetGenImage get finOnboarding12x =>
      const AssetGenImage('assets/images/fin_onboarding_1@2x.png');

  /// File path: assets/images/fin_onboarding_2@2x.png
  AssetGenImage get finOnboarding22x =>
      const AssetGenImage('assets/images/fin_onboarding_2@2x.png');

  /// File path: assets/images/fin_onboarding_3@2x.png
  AssetGenImage get finOnboarding32x =>
      const AssetGenImage('assets/images/fin_onboarding_3@2x.png');

  /// File path: assets/images/login_bg@2x.png
  AssetGenImage get loginBg2x =>
      const AssetGenImage('assets/images/login_bg@2x.png');

  /// File path: assets/images/noTransactions.png
  AssetGenImage get noTransactions =>
      const AssetGenImage('assets/images/noTransactions.png');

  /// File path: assets/images/transferComplete@2x.png
  AssetGenImage get transferComplete2x =>
      const AssetGenImage('assets/images/transferComplete@2x.png');

  /// File path: assets/images/user_2@2x.png
  AssetGenImage get user22x =>
      const AssetGenImage('assets/images/user_2@2x.png');

  /// File path: assets/images/visa@3x.png
  AssetGenImage get visa3x => const AssetGenImage('assets/images/visa@3x.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        medicalScheduleApp00,
        appLauncherIcon,
        avatar,
        createAccountBg2x,
        emptyBudgets2x,
        finWalletLogoLandscape,
        finWalletLogoLandscapeDark3x,
        finBudgetRemove2x,
        finOnboarding12x,
        finOnboarding22x,
        finOnboarding32x,
        loginBg2x,
        noTransactions,
        transferComplete2x,
        user22x,
        visa3x
      ];
}

class $AssetsLottieAnimationsGen {
  const $AssetsLottieAnimationsGen();

  /// File path: assets/lottie_animations/custom_loader.json
  LottieGenImage get customLoader =>
      const LottieGenImage('assets/lottie_animations/custom_loader.json');

  /// List of all assets
  List<LottieGenImage> get values => [customLoader];
}

class $AssetsRiveAnimationsGen {
  const $AssetsRiveAnimationsGen();

  /// File path: assets/rive_animations/button.riv
  RiveGenImage get button =>
      const RiveGenImage('assets/rive_animations/button.riv');

  /// File path: assets/rive_animations/check.riv
  RiveGenImage get check =>
      const RiveGenImage('assets/rive_animations/check.riv');

  /// File path: assets/rive_animations/confetti.riv
  RiveGenImage get confetti =>
      const RiveGenImage('assets/rive_animations/confetti.riv');

  /// File path: assets/rive_animations/house.riv
  RiveGenImage get house =>
      const RiveGenImage('assets/rive_animations/house.riv');

  /// File path: assets/rive_animations/icons.riv
  RiveGenImage get icons =>
      const RiveGenImage('assets/rive_animations/icons.riv');

  /// File path: assets/rive_animations/menu_button.riv
  RiveGenImage get menuButton =>
      const RiveGenImage('assets/rive_animations/menu_button.riv');

  /// File path: assets/rive_animations/shapes.riv
  RiveGenImage get shapes =>
      const RiveGenImage('assets/rive_animations/shapes.riv');

  /// List of all assets
  List<RiveGenImage> get values =>
      [button, check, confetti, house, icons, menuButton, shapes];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieAnimationsGen lottieAnimations =
      $AssetsLottieAnimationsGen();
  static const $AssetsRiveAnimationsGen riveAnimations =
      $AssetsRiveAnimationsGen();
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

class RiveGenImage {
  const RiveGenImage(this._assetName);

  final String _assetName;

  RiveAnimation rive({
    String? artboard,
    List<String> animations = const [],
    List<String> stateMachines = const [],
    BoxFit? fit,
    Alignment? alignment,
    Widget? placeHolder,
    bool antialiasing = true,
    List<RiveAnimationController> controllers = const [],
    OnInitCallback? onInit,
  }) {
    return RiveAnimation.asset(
      _assetName,
      artboard: artboard,
      animations: animations,
      stateMachines: stateMachines,
      fit: fit,
      alignment: alignment,
      placeHolder: placeHolder,
      antialiasing: antialiasing,
      controllers: controllers,
      onInit: onInit,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
