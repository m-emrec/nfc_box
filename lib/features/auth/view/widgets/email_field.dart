import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/mixins/text_field_validator_mixin.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> with TextFieldStateMixin {
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

  String? validator(value) => value!.length < 2 ? "asdad" : null;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      color: setColorState(),
      focusNode: _focusNode,
      controller: widget.controller,
      label: "Email",
      prefixIcon: Image.asset(
        AppAssets.emailFieldIconPath,
      ),
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
