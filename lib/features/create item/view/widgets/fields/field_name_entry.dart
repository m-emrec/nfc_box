import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

/// This will be used as the name of the elected field
class FieldNameEntry extends StatelessWidget {
  final int? index;
  const FieldNameEntry({
    super.key,
    this.index,
    this.controller,
  });
  final TextEditingController? controller;
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
