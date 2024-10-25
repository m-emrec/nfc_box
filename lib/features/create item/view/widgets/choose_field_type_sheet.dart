import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/features/create%20item/view/widgets/fields/color_field.dart';

import '../../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../enums/field_names.dart';
import '../../model/field_model.dart';
import '../../providers/providers.dart';
import 'fields/field_name_entry.dart';

class ChooseFieldTypeSheet extends ConsumerWidget {
  const ChooseFieldTypeSheet({
    super.key,
  });
  static const List<FieldNames> _fieldNames = FieldNames.values;
  onSelected(BuildContext context, WidgetRef ref) {
    final TextEditingController fieldNameController = TextEditingController();
    final TextEditingController fieldontroller = TextEditingController();
    ref.read(fieldListProvider.notifier).update((list) => [
          ...list,
          FieldModel(
            fieldName: FieldNameEntry(
              index: 1,
              controller: fieldNameController,
            ),
            field: CustomTextField(),
            fieldNameController: fieldNameController,
            fieldController: fieldontroller,
          ),
        ]);
    context.pop();
  }

  static final Map _a = {
    FieldNames.Color: ColorField(),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomSheet(
      heightFactor: 0.25,
      content: ListView(
        children: List.generate(
          _fieldNames.length,
          (index) => ListTile(
            title: Text(_fieldNames[index].name),
            onTap: () => onSelected(context, ref),
          ),
        ),
      ),
    );
  }
}
