import 'package:flutter/material.dart';
import '../../constants/app_assets.dart';

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
  });

  final String? label;
  bool get obscured => false;
  Image get prefixIcon;
  late bool showError;
  final TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  TextInputAction textInputAction;
  String? helperText;
  Widget? suffix;
  @override
  FormFieldBuilder<String> get builder => (state) {
        bool isEmpty = controller!.text.isEmpty;
        bool isValid = !state.hasError;

        /// if the [TextField] is not empty and is not valid then it can show error.
        /// if the [TextField] is empty don't show error
        bool showError = isEmpty == false && isValid == false;
        return TextFormField(
          style: TextStyles().textTheme.bodyLarge,
          textCapitalization: textCapitalization,
          controller: controller,
          obscureText: obscured,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
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

class EmailField extends CustomTextField {
  EmailField({
    super.key,
    super.controller,
  }) : super(
          label: "Email",
          validator: (value) => value!.length < 3 ? "asd" : null,
          autofillHints: [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          helperText: "xx@xxx.com",
        );
  @override
  Image get prefixIcon => Image.asset(
        AppAssets.emailFieldIconPath,
      );
}
