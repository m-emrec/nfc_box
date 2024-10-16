import 'package:flutter/material.dart';
import 'package:nfc_box/logger.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

abstract class CustomTextField extends TextFormField {
  CustomTextField({
    super.key,
    super.controller,
    super.validator,
    this.label,
    super.autofillHints,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.helperText,
    this.suffix,
    super.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.obscured = false,
    this.focusNode,
  });

  final FocusNode? focusNode;
  final String? label;
  bool obscured;
  Widget get prefixIcon;
  final TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  String? helperText;
  Widget? suffix;

  /// if the [TextField] is not empty and is not valid then it can show error.
  /// if the [TextField] is empty don't show error
  bool shouldShowError(FormFieldState<String> state) {
    bool isEmpty = controller?.text.isEmpty ?? true;
    bool isValid = !state.hasError;
    bool hasFocus = focusNode?.hasFocus ?? false;
    return !isValid;
  }

  @override
  FormFieldBuilder<String> get builder => (state) {
        bool isFocused = focusNode?.hasFocus ?? false;
        // logger.i(isFocused);
        bool showError = shouldShowError(state);

        return TextFormField(
          focusNode: focusNode,
          validator: validator,
          style: TextStyles().textTheme.bodyLarge,
          textCapitalization: textCapitalization,
          controller: controller,
          obscureText: obscured,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            errorText: state.errorText,
            helperText: helperText,
            labelText: label,
            // helperStyle: ,
            suffix: suffix,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: showError
                    ? AppColors.accentError[40]!
                    : isFocused
                        ? AppColors.accentOrange[50]! // Highlight when focused
                        : AppColors.neutralGray500[40]!,
              ),
            ),
            prefixIcon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                showError
                    ? AppColors.accentError[40]!
                    : isFocused
                        ? AppColors.accentOrange // Highlight when focused
                        : AppColors.neutralGray500[40]!,
                BlendMode.srcATop,
              ),
              child: prefixIcon,
            ),
          ),
        );
      };
}
