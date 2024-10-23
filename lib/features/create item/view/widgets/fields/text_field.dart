// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nfc_box/core/utils/widgets/custom_text_field.dart';

class FieldText extends StatelessWidget {
  final TextEditingController controller;
  const FieldText({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
    );
  }
}
