import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_box/config/theme/theme_extensions/inline_text_button_theme.dart';

import '../../core/constants/app_paddings.dart';
import '../../core/constants/border_radiuses.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';

class AppTheme {
  ThemeData get theme => _theme;

  final ThemeData _theme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    /// colors
    scaffoldBackgroundColor: AppColors.neutralBackgroundLight,
    primaryColor: AppColors.primaryBlue[50],
    textTheme: TextStyles().textTheme,

    /// Widget Themes
    appBarTheme: _appBarTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    inputDecorationTheme: _inputDecoration(),
    extensions: _extensions,
  );

  static final Iterable<ThemeExtension<dynamic>> _extensions = [
    InlineTextButtonTheme(
      style: TextStyles()
          .textTheme
          .labelLarge
          ?.copyWith(color: AppColors.accentOrange),
    ),
  ];

  static InputDecorationTheme _inputDecoration() {
    return InputDecorationTheme(
      labelStyle: TextStyles().textTheme.bodyLarge?.copyWith(
            color: AppColors.neutralGray500[40],
          ),
      alignLabelWithHint: false,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.accentError[40]!,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.accentError[40]!,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.neutralGray500[50]!,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.accentOrange,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppPaddings.xsPadding,
        horizontal: AppPaddings.xsPadding,
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      color: AppColors.neutralBackgroundLight,
      systemOverlayStyle: const SystemUiOverlayStyle(
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
        backgroundColor: AppColors.neutralBackgroundLight,
        foregroundColor: AppColors.secondaryTeal,
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.mPadding,
          vertical: AppPaddings.sPadding,
        ),
        maximumSize: const Size.fromHeight(52),
        side: BorderSide(color: AppColors.secondaryLightTeal),
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
        foregroundColor: AppColors.primaryBlue[0],
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
