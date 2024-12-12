import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_box/config/theme/theme_extensions/custom_bottom_sheet_them.dart';
import 'package:nfc_box/config/theme/theme_extensions/item_card_theme.dart';

import '../../core/constants/app_paddings.dart';
import '../../core/constants/border_radiuses.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'theme_extensions/inline_text_button_theme.dart';

class AppTheme {
  ThemeData get theme => _theme;
  final ThemeData _theme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    //* colors
    scaffoldBackgroundColor: AppColors.neutralBackgroundLight[50],
    primaryColor: AppColors.primaryBlue[50],
    textTheme: TextStyles().textTheme,

    /// Widget Themes
    dialogTheme: _dialogTheme(),
    appBarTheme: _appBarTheme(),
    elevatedButtonTheme: _elevatedButtonTheme(),
    popupMenuTheme: _popMenuTheme(),
    outlinedButtonTheme: _outlinedButtonTheme(),
    textButtonTheme: _textButtonTheme(),
    inputDecorationTheme: _inputDecoration(),
    extensions: _extensions,
    checkboxTheme: _checkboxTheme(),
    progressIndicatorTheme: _progressIndicatorTheme(),
    floatingActionButtonTheme: _floatingActionButtonTheme(),
    datePickerTheme: _datePickerTheme(),
  );

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      backgroundColor: AppColors.neutralBackgroundLight[50],
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.smallBorderRadius,
      ),
    );
  }

  static PopupMenuThemeData _popMenuTheme() {
    return PopupMenuThemeData(
      color: AppColors.neutralBackgroundLight[50],
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.smallBorderRadius,
      ),
      position: PopupMenuPosition.under,
    );
  }

  static DatePickerThemeData _datePickerTheme() => DatePickerThemeData(
        backgroundColor: AppColors.neutralBackgroundLight[10],
        cancelButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            AppColors.accentError[50],
          ),
        ),
        confirmButtonStyle: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            AppColors.accentSuccess[80],
          ),
        ),
        dayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.secondaryLightTeal[20];
            }
            return null;
          },
        ),
        dayForegroundColor:
            WidgetStatePropertyAll(AppColors.neutralGray900[50]),
        todayBorder: BorderSide.none,
        todayForegroundColor: WidgetStatePropertyAll(
          AppColors.primaryBlue[70],
        ),
        todayBackgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.secondaryLightTeal[20];
            }
            return null;
          },
        ),
      );

  static FloatingActionButtonThemeData _floatingActionButtonTheme() =>
      FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBlue[50],
        foregroundColor: AppColors.neutralGray100[50],
        elevation: 3,
      );

  static ProgressIndicatorThemeData _progressIndicatorTheme() =>
      ProgressIndicatorThemeData(
        color: AppColors.secondaryTeal[30],
      );

  static CheckboxThemeData _checkboxTheme() => CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.accentSuccess[90]!;
            }
            return Colors.transparent;
          },
        ),
        shape: const CircleBorder(),
        side: BorderSide(
          color: AppColors.secondaryLightTeal,
          width: 2.5,
        ),
      );

  static final Iterable<ThemeExtension<dynamic>> _extensions = [
    InlineTextButtonTheme(
      style: TextStyles()
          .textTheme
          .labelLarge
          ?.copyWith(color: AppColors.accentOrange),
    ),
    CustomBottomSheetTheme(
      shadowColor: AppColors.neutralBackgroundLight[100],
      handleColor: AppColors.neutralBackgroundLight[100],
      backgroundColor: AppColors.neutralBackgroundLight[50],
    ),
    ItemCardTheme(
      backgroundColor: AppColors.neutralBackgroundLight[50],
      shadowColor: AppColors.neutralBackgroundLight[20],
      removeButtonColor: AppColors.accentError[50],
      removeButtonIconColor: Colors.white,
      errorImageBackgroundColor: AppColors.accentError,
      errorImageIconColor: AppColors.accentError[70],
      errorToolTipBackgroundColor: AppColors.accentError[20],
      elevation: 5,
      dateTextStyle: TextStyles().textTheme.bodySmall?.copyWith(
            color: AppColors.neutralGray500[50],
          ),
      titleTextStyle: TextStyles().textTheme.bodyLarge,
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
      actionsIconTheme: IconThemeData(
        color: AppColors.secondaryTeal[50],
      ),
      color: AppColors.neutralBackgroundLight[50],
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.neutralBackgroundLight.withOpacity(0.1),
        systemNavigationBarColor: AppColors.neutralBackgroundLight,
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
        maximumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.smallBorderRadius,
        ),
      ),
    );
  }
}
