import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/buttons/responsive_button.dart';
import 'choose_field_type_sheet.dart';

class FieldList extends StatefulWidget {
  const FieldList({super.key});

  @override
  State<FieldList> createState() => _FieldListState();
}

class _FieldListState extends State<FieldList> {
  showBottoSheet() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => const ChooseFieldTypeSheet(),
    );
  }

  // List<CustomTextField> _fieldList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [],
          ),
          ResponsiveElevatedButton(
            onPressed: () => showBottoSheet(),
            child: Text("Add Field"),
            isPrimary: false,
          ),
        ],
      ),
    );
  }
}
