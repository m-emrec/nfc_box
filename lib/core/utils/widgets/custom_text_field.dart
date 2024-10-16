import 'package:flutter/material.dart';

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
  });

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
    return !isEmpty && !isValid;
  }

  @override
  FormFieldBuilder<String> get builder => (state) {
        bool showError = shouldShowError(state);
        return TextFormField(
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
                    ? AppColors.accentError[50]!
                    : AppColors.accentOrange,
              ),
            ),
            prefixIcon: ColorFiltered(
              colorFilter: ColorFilter.mode(
                showError
                    ? AppColors.accentError[40]!
                    : AppColors.neutralGray500[40]!,
                BlendMode.srcATop,
              ),
              child: prefixIcon,
            ),
          ),
        );
      };
}
