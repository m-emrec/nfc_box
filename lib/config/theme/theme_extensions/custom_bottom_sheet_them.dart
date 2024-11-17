import 'package:flutter/material.dart';

class CustomBottomSheetTheme extends ThemeExtension<CustomBottomSheetTheme> {
  final Color? shadowColor;
  final Color? handleColor;
  final Color? backgroundColor;

  CustomBottomSheetTheme({
    this.shadowColor,
    this.handleColor,
    this.backgroundColor,
  });

  @override
  @override
  CustomBottomSheetTheme lerp(
      ThemeExtension<CustomBottomSheetTheme>? other, double t) {
    if (other is! CustomBottomSheetTheme) return this;
    return CustomBottomSheetTheme(
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
      handleColor: Color.lerp(handleColor, other.handleColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

  @override
  ThemeExtension<CustomBottomSheetTheme> copyWith({
    Color? shadowColor,
    Color? handleColor,
    Color? backgroundColor,
  }) {
    return CustomBottomSheetTheme(
      shadowColor: shadowColor ?? this.shadowColor,
      handleColor: handleColor ?? this.handleColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}
