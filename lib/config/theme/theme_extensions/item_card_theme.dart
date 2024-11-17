import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ItemCardTheme extends ThemeExtension<ItemCardTheme> {
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? removeButtonColor;
  final Color? removeButtonIconColor;
  final Color? errorImageBackgroundColor;
  final Color? errorImageIconColor;
  final Color? errorToolTipBackgroundColor;
  final double? elevation;

  final TextStyle? dateTextStyle;
  final TextStyle? titleTextStyle;
  ItemCardTheme({
    this.backgroundColor,
    this.shadowColor,
    this.removeButtonColor,
    this.removeButtonIconColor,
    this.errorImageBackgroundColor,
    this.errorImageIconColor,
    this.errorToolTipBackgroundColor,
    this.elevation,
    this.dateTextStyle,
    this.titleTextStyle,
  });

  @override
  ThemeExtension<ItemCardTheme> copyWith({
    Color? backgroundColor,
    Color? shadowColor,
    Color? removeButtonColor,
    Color? removeButtonIconColor,
    Color? errorImageBackgroundColor,
    Color? errorImageIconColor,
    Color? errorToolTipBackgroundColor,
    double? elevation,
    TextStyle? dateTextStyle,
    TextStyle? titleTextStyle,
  }) {
    return ItemCardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      shadowColor: shadowColor ?? this.shadowColor,
      removeButtonColor: removeButtonColor ?? this.removeButtonColor,
      removeButtonIconColor:
          removeButtonIconColor ?? this.removeButtonIconColor,
      errorImageBackgroundColor:
          errorImageBackgroundColor ?? this.errorImageBackgroundColor,
      errorImageIconColor: errorImageIconColor ?? this.errorImageIconColor,
      errorToolTipBackgroundColor:
          errorToolTipBackgroundColor ?? this.errorToolTipBackgroundColor,
      elevation: elevation ?? this.elevation,
      dateTextStyle: dateTextStyle ?? this.dateTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  ThemeExtension<ItemCardTheme> lerp(
      covariant ThemeExtension<ItemCardTheme>? other, double t) {
    if (other is! ItemCardTheme) {
      return this;
    }

    return ItemCardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      removeButtonColor:
          Color.lerp(removeButtonColor, other.removeButtonColor, t),
      removeButtonIconColor:
          Color.lerp(removeButtonIconColor, other.removeButtonIconColor, t),
      errorImageBackgroundColor: Color.lerp(
          errorImageBackgroundColor, other.errorImageBackgroundColor, t),
      errorImageIconColor:
          Color.lerp(errorImageIconColor, other.errorImageIconColor, t),
      errorToolTipBackgroundColor: Color.lerp(
          errorToolTipBackgroundColor, other.errorToolTipBackgroundColor, t),
      elevation: lerpDouble(elevation, other.elevation, t),
      dateTextStyle: TextStyle.lerp(dateTextStyle, other.dateTextStyle, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
    );
  }
}
