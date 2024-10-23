import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/core/utils/widgets/custom_text_field.dart';
import 'package:nfc_box/features/create%20item/model/field_model.dart';
import 'package:nfc_box/features/create%20item/model/item.dart';
import 'package:nfc_box/features/create%20item/view/widgets/fields/date_field.dart';
import 'package:nfc_box/features/create%20item/view/widgets/fields/field_name.dart';
import 'package:nfc_box/logger.dart';

import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../providers/providers.dart';

class FieldList extends ConsumerStatefulWidget {
  const FieldList({super.key});

  @override
  ConsumerState<FieldList> createState() => _FieldListState();
}

class _FieldListState extends ConsumerState<FieldList> {
  showBottomSheet() async {
    ref.read(fieldListProvider.notifier).update((list) => [
          ...list,
          FieldModel(
            fieldName: FieldName(
              index: 1,
              controller: TextEditingController(),
            ),
            field: CustomTextField(),
            fieldNameController: TextEditingController(),
            fieldController: TextEditingController(),
          ),
        ]);
    // await showModalBottomSheet(
    //   context: context,
    //   builder: (context) => const ChooseFieldTypeSheet(),
    // );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        ...ref.watch(fieldListProvider).map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: AppPaddings.lPadding),
                child: Column(
                  children: [
                    e.fieldName,
                    Padding(
                      padding: EdgeInsets.only(left: AppPaddings.lPadding),
                      child: e.field,
                    ),
                  ],
                ),
              ),
            ),
        FieldDate(),
        ResponsiveElevatedButton(
          onPressed: () => showBottomSheet(),
          isPrimary: false,
          child: const Text("Add Field"),
        ),
      ],
    );
  }
}
