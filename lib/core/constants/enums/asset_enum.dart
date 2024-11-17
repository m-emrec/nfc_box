part of '../app_assets.dart';

/// This enum contains path's of every image used in this project.
enum _ImagePaths {
  logo("${_rootImagePath}logo.png"),
  mainPageIllustration("${_rootImagePath}mainPageİll.png"),
  ;

  static const String _rootImagePath = "lib/core/assets/images/";

  final String path;

  const _ImagePaths(this.path);
}

/// This enum contains path's of every animation used in this project.
enum _AnimationPaths {
  facebook("${_rootAniPath}ani_facebook.json"),
  google("${_rootAniPath}ani_google.json"),
  howToReadNfc("${_rootAniPath}ani_how_to_read_nfc.json"),
  readingNfc("${_rootAniPath}ani_reading_nfc.json"),
  splash("${_rootAniPath}ani_splash.json"),
  ;

  static const String _rootAniPath = "lib/core/assets/animations/";

  final String path;

  const _AnimationPaths(this.path);
}

/// This enum contains path's of every icons used in this project.
enum _IconPaths {
  chooseImage("${_rootIconPath}ic_chooseImage.png"),
  emailFieldIcon("${_rootIconPath}ic_email.png"),
  passwordIcon("${_rootIconPath}ic_password.png"),
  removeBox("${_rootIconPath}ic_removebox.png"),
  save("${_rootIconPath}ic_save.png"),
  sort("${_rootIconPath}ic_sort.png"),
  viewType("${_rootIconPath}ic_viewType.png"),
  ;

  static const String _rootIconPath = "lib/core/assets/icons/";

  final String path;

  const _IconPaths(this.path);
}
