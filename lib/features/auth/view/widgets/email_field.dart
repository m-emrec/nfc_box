import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../../../config/localization/lang/locale_keys.g.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/mixins/text_field_validator_mixin.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

class EmailField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;
  const EmailField({
    super.key,
    required this.controller,
    this.textInputAction = TextInputAction.next,
  });

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

  String? validator(value) => EmailValidator.validate(value)
      ? null
      : tr(LocaleKeys.signin_validEmailError);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      color: setColorState(),
      focusNode: _focusNode,
      controller: widget.controller,
      label: tr(LocaleKeys.signin_email),
      prefixIcon: Image.asset(
        AppAssets.emailFieldIconPath,
      ),
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      textInputAction: widget.textInputAction,
    );
  }
}
