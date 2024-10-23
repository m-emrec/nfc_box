import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../enums/field_names.dart';

class ChooseFieldTypeSheet extends StatelessWidget {
  const ChooseFieldTypeSheet({
    super.key,
  });
  static const List<FieldNames> _fieldNames = FieldNames.values;
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      heightFactor: 0.25,
      content: ListView(
        children: List.generate(
          _fieldNames.length,
          (index) => ListTile(
            title: Text(_fieldNames[index].name),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
