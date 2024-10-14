import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/constants/app_paddings.dart';
import '../../core/constants/border_radiuses.dart';

class AppTheme {
  ThemeData get theme => _theme;

  final ThemeData _theme = ThemeData(
    brightness: Brightness.light,

    /// colors
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.blueColor,
    textTheme: TextStyles().textTheme,

    /// Widget Themes
    appBarTheme: _appBarTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyles().textTheme.bodyLarge,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.gray500,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.orangeColor,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppPaddings.xxsPadding,
        horizontal: AppPaddings.xsPadding,
      ),
    ),
    extensions: const [],
  );

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyles().textTheme.labelMedium,
        foregroundColor: AppColors.secondaryTextColor,
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // Colors
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.tealColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.mPadding,
          vertical: AppPaddings.sPadding,
        ),
        side: BorderSide(color: AppColors.lightTealColor),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
        ),
      ),
    );
  }

  /// Elevated Button theme
  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.lightTextColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.mPadding,
          vertical: AppPaddings.sPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
        ),
      ),
    );
  }
}

class AppColors {
  /// Text Colors

  ///For descriptions or subtitles
  static Color secondaryTextColor = HexColor("4A4A4A");

  ///For body text and main sections
  static Color primaryTextColor = HexColor("1E1E1E");

  /// For text over dark backgrounds
  static Color lightTextColor = HexColor("FFFFFF");

  /// For error messages or warnings
  static Color errorTextColor = HexColor("D32F2F");

  /// Colors
  /// Primary : Used for main buttons, active states, and primary actions
  static Color blueColor = HexColor("0066FF");

  /// Primary : For hover states and backgrounds
  static Color lightBlueColor = HexColor("3399FF");

  //* Secondary Colors
  ///Secondary : Used for secondary buttons and highlights
  static Color tealColor = HexColor("00B3A6");

  ///Secondary : For hover or accent in the UI
  static Color lightTealColor = HexColor("66D6CF");

  //* Accent Colors
  ///Accent: For notifications, alerts, or key features
  static Color yellowColor = HexColor("FFD700");

  ///Accent:For icons, highlights, or attention-grabbing features
  static Color orangeColor = HexColor("FF914D");

  //* Neutral Colors
  /// Neutral
  static Color backgroundColor = HexColor("F4F7F9");

  /// Neutral : For borders, inactive buttons
  static Color gray100 = HexColor("F0F0F0");

  /// Neutral : For icons, input placeholders
  static Color gray500 = HexColor("A0A0A0");

  /// Neutral :For text color in headers or dark themes
  static Color gray900 = HexColor("333333");

  static Color primaryColor = HexColor("8F6AA4");
  static Color accentColor = HexColor("4B6B8B");
  static Color secondaryColor = HexColor("F5DBDB");

  /// Widget Colors
}

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
    /// Body
    bodyMedium: _font(
      color: AppColors.secondaryTextColor,
    ),
    bodySmall: _font(
      color: AppColors.secondaryTextColor,
    ),

    /// Labels
    labelLarge: _font(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _font(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
  );
}
