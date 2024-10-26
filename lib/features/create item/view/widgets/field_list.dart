import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../providers/providers.dart';
import 'fields/choose field type/choose_field_type_sheet.dart';

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
