import 'package:flutter/material.dart';

class AppBorderRadius {
  ///  ` 8px circular radius `
  static BorderRadiusGeometry smallBorderRadius =
      BorderRadius.circular(smallRadiusValue);

  ///  ` 16px circular radius `
  static BorderRadiusGeometry mediumBorderRadius =
      BorderRadius.circular(mediumRadiusValue);

  ///  ` 32px circular radius `
  static BorderRadiusGeometry largeBorderRadius =
      BorderRadius.circular(largeRadiusValue);

  /// 8px
  static double smallRadiusValue = 8;

  /// 16px
  static double mediumRadiusValue = 16;

  /// 32px
  static double largeRadiusValue = 32;
}
