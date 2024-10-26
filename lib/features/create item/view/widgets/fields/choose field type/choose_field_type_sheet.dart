import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../../../enums/field_names.dart';
import '../../../../model/field_model.dart';
import '../../../../providers/providers.dart';
import '../color_field.dart';
import '../date_field_entry.dart';
import '../text_field_entry.dart';

part "choose_field_type_properties.dart";

class ChooseFieldTypeSheet extends ConsumerWidget {
  const ChooseFieldTypeSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomSheet(
      heightFactor: 0.25,
      content: ListView(
        children: List.generate(
          _ChooseFieldTypeSheetProperties._fieldNames.length,
          (index) => ListTile(
            title:
                Text(_ChooseFieldTypeSheetProperties._fieldNames[index].name),
            onTap: () => _ChooseFieldTypeSheetProperties.onSelected(
              context,
              ref: ref,
              fieldName: _ChooseFieldTypeSheetProperties._fieldNames[index],
            ),
          ),
        ),
      ),
    );
  }
}
