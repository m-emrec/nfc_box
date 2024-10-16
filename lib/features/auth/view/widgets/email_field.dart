import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class EmailField extends CustomTextField {
  EmailField({
    super.key,
    super.controller,
  }) : super(
          label: "Email",
          validator: (value) =>
              value!.length < 6 ? "Please write a valid email address" : null,
          autofillHints: [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          helperText: "xx@xxx.com",
          focusNode: FocusNode(),
        );

  @override
  Image get prefixIcon => Image.asset(
        AppAssets.emailFieldIconPath,
      );
}
