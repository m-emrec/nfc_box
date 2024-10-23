// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:nfc_box/core/extensions/context_extension.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class FieldName extends StatelessWidget {
  final int index;
  const FieldName({
    super.key,
    required this.index,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var label = "Field Name";
    return CustomTextField(
      label: label,
      controller: controller,
      prefixIcon: Card(
        color: AppColors.neutralGray500[100],
        child: SizedBox(
          height: 16,
          width: 16,
          child: Center(
            child: Text(
              "$index.",
              style: context.textTheme.labelLarge
                  ?.copyWith(color: AppColors.lightText100),
            ),
          ),
        ),
      ),
    );
  }
}
