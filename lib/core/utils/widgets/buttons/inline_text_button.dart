import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/config/theme/theme_extensions/inline_text_button_theme.dart';
import '../../../extensions/context_extension.dart';

class InlineTextButton extends TextSpan {
  const InlineTextButton(
    this.context, {
    super.text,
    // super.style,
    super.children,
    this.onTap,

    // super.recognizer,
  }) : super();
  @override
  TextStyle? get style =>
      context.theme.extension<InlineTextButtonTheme>()?.style;
  final void Function()? onTap;
  final BuildContext context;
  @override
  GestureRecognizer? get recognizer => TapGestureRecognizer()..onTap = onTap;
}
