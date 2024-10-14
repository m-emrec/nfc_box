part of '../app_assets.dart';

/// This enum contains path's of every asset used in this project.
enum _AssetEnum {
  /// Images
  logo("${_rootImagePath}logo.png"),
  pageEffect("${_rootImagePath}pageEffect.png"),

  /// Icons
  emailFieldIcon("${_rootIconPath}ic_email_field.png"),
  passwordIcon("${_rootIconPath}ic_password.png"),
  // googleIcon("${_rootIconPath}ic_google.png"),
  googleIcon("${_rootAnimationPath}ani_google.json"),
  facebookIcon("${_rootAnimationPath}ani_facebook.json"),
  ;

  static const String _rootIconPath = "lib/core/assets/icons/";
  static const String _rootImagePath = "lib/core/assets/images/";
  static const String _rootAnimationPath = "lib/core/assets/animations/";

  final String path;

  const _AssetEnum(this.path);
}
