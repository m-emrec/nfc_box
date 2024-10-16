import 'package:flutter/material.dart';

class InlineTextButtonTheme extends ThemeExtension<InlineTextButtonTheme> {
  final TextStyle? style;

  InlineTextButtonTheme({this.style});

  @override
  ThemeExtension<InlineTextButtonTheme> copyWith({
    TextStyle? style,
  }) =>
      InlineTextButtonTheme(
        style: style ?? this.style,
      );

  @override
  ThemeExtension<InlineTextButtonTheme> lerp(
      covariant ThemeExtension<InlineTextButtonTheme>? other, double t) {
    if (other is! InlineTextButtonTheme) {
      return this;
    }
    return InlineTextButtonTheme(
      style: TextStyle.lerp(style, other.style, t),
    );
  }
}
