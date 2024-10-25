import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../model/field_model.dart';
import '../../providers/providers.dart';
import 'choose_field_type_sheet.dart';
import 'fields/date_field_entry.dart';
import 'fields/field_name_entry.dart';

class FieldList extends ConsumerStatefulWidget {
  const FieldList({super.key});

  @override
  ConsumerState<FieldList> createState() => _FieldListState();
}

class _FieldListState extends ConsumerState<FieldList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        ...ref.watch(fieldListProvider).map(
              (field) => Padding(
                padding: EdgeInsets.only(bottom: AppPaddings.lPadding),
                child: Column(
                  children: [
                    field.fieldName,
                    Padding(
                      padding: EdgeInsets.only(left: AppPaddings.lPadding),
                      child: field.field,
                    ),
                  ],
                ),
              ),
            ),
        // const DateFieldEntry(),
        ResponsiveElevatedButton(
          onPressed: () async => showBottomSheet(),
          isPrimary: false,
          child: const Text(addField),
        ),
      ],
    );
  }

  void showBottomSheet() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const ChooseFieldTypeSheet(),
    );
  }

  static const String addField = 'Add Field';
}
