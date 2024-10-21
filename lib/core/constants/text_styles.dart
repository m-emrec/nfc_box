import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class TextStyles {
  /// Poppins font
  static TextStyle _font({
    Paint? background,
    Color? backgroundColor,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    List<FontFeature>? fontFeatures,
    double? fontSize,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Paint? foreground,
    double? height,
    double? letterSpacing,
    Locale? locale,
    List<Shadow>? shadows,
    TextBaseline? textBaseline,
    TextStyle? textStyle,
    double? wordSpacing,
  }) =>
      GoogleFonts.poppins(
        background: background,
        backgroundColor: backgroundColor,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        fontFeatures: fontFeatures,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        foreground: foreground,
        height: height,
        letterSpacing: letterSpacing,
        locale: locale,
        shadows: shadows,
        textBaseline: textBaseline,
        textStyle: textStyle,
        wordSpacing: wordSpacing,
      );

  final TextTheme textTheme = TextTheme(
    titleLarge: _font(
      foreground: Paint()..color = AppColors.primaryTextColor,
    ),
    titleMedium: _font(),
    titleSmall: _font(),

    /// Body
    bodyLarge: _font(
      color: AppColors.primaryTextColor,
    ),
    bodyMedium: _font(
      color: AppColors.secondaryTextColor,
    ),
    bodySmall: _font(
      color: AppColors.secondaryTextColor,
    ),

    /// Labels
    labelLarge: _font(
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _font(
      color: AppColors.primaryTextColor,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  );
}
