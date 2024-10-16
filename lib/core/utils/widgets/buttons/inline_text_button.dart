import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';

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
  TextStyle? get style => context.textTheme.labelLarge;
  final void Function()? onTap;
  final BuildContext context;
  @override
  GestureRecognizer? get recognizer => TapGestureRecognizer()..onTap = onTap;
}
