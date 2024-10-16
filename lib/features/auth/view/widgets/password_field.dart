import 'package:flutter/material.dart';
import 'package:nfc_box/core/constants/app_assets.dart';
import 'package:nfc_box/core/utils/widgets/custom_text_field.dart';

class PasswordField extends CustomTextField {
  PasswordField({
    super.key,
    super.controller,
  }) : super(
          textInputAction: TextInputAction.done,
          label: "Password",
          validator: (value) => value!.length < 6
              ? "Your password must be longer than 6 characters"
              : null,
          obscured: true,
        );

  @override
  Widget get suffix => StatefulBuilder(
        builder: (context, setState) {
          return GestureDetector(
            onTap: () {
              // Toggle the password visibility
              setState(() {
                obscured = !obscured;
                controller?.text += " ";
                controller?.text = controller?.text.trimRight() ?? "";
              });
            },
            child: Icon(
              obscured ? Icons.visibility_off : Icons.visibility, // Switch icon
            ),
          );
        },
      );

  @override
  Widget get prefixIcon => Image.asset(AppAssets.passwordIconPath);
}
