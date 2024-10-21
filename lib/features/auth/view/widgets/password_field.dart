import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/mixins/text_field_validator_mixin.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField>
    with TextFieldStateMixin {
  bool obscured = true;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    initTextFieldState(
      setState: setState,
      focusNode: _focusNode,
      controller: widget.controller,
      validator: validator,
    );

    super.initState();
  }

  String? validator(value) => value!.length < 6
      ? "Your password must be longer than 6 characters"
      : null;

  @override
  void dispose() {
    disposeTextFieldState();
    super.dispose();
  }

  final String label = 'Password';
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      color: setColorState(),
      focusNode: _focusNode,
      obscured: obscured,
      controller: widget.controller,
      label: label,
      prefixIcon: Image.asset(
        AppAssets.passwordIconPath,
      ),
      validator: validator,
      suffix: GestureDetector(
        onTap: () {
          // Toggle the password visibility
          setState(() {
            obscured = !obscured;
          });
        },
        child: Icon(
          obscured ? Icons.visibility_off : Icons.visibility, // Switch icon
        ),
      ),
    );
  }
}
