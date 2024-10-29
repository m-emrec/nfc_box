import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../../../../core/utils/widgets/custom bottom sheet/custom_bottom_sheet.dart';
import '../../../../../../core/constants/enums/item_field_names.dart';
import '../../../../../../core/utils/models/field_model.dart';
import '../../../../providers/providers.dart';
import '../color field/color_field.dart';
import '../date field entry/date_field_entry.dart';
import '../text_field_entry.dart';

part "utils.dart";

class ChooseFieldTypeSheet extends ConsumerWidget {
  const ChooseFieldTypeSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomSheet(
      heightFactor: 0.25,
      content: ListView(
        shrinkWrap: true,
        children: List.generate(
          _ChooseFieldTypeSheetUtils._fieldNames.length,
          (index) => ListTile(
            title: Text(_ChooseFieldTypeSheetUtils._fieldNames[index].name),
            onTap: () => _ChooseFieldTypeSheetUtils.onSelected(
              context,
              ref: ref,
              fieldName: _ChooseFieldTypeSheetUtils._fieldNames[index],
            ),
          ),
        ),
      ),
    );
  }
}
