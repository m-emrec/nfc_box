import 'package:flutter/material.dart';
import 'package:nfc_box/features/create%20item/view/widgets/fields/text_field_entry.dart';
import 'package:nfc_box/logger.dart';

import '../view/widgets/fields/field_name_entry.dart';

/// This is the structure of the Fields
///
/// Every field has a
///
/// **fieldName** holds the name of the given field.
/// : *excepts [Widget]*
///
/// **field** holds the given field .
/// For now it can be [ColorField],[DateField] or [TextField]
/// : *excepts [Widget]*
///
/// **fieldNameController** and f**ieldController** holds the [TextEditingController]s
/// for the given fieldName and field
/// : *excepts [TextEditingController]*
class FieldModel {
  final Widget fieldName;
  final Widget field;
  final TextEditingController fieldNameController;
  final TextEditingController fieldController;

  FieldModel({
    required this.fieldName,
    required this.field,
    required this.fieldNameController,
    required this.fieldController,
  });

  factory FieldModel.createModel({
    required int fieldIndex,
    required Widget field,
  }) {
    final TextEditingController fieldNameController = TextEditingController();
    final TextEditingController fieldController = TextEditingController();

    final Widget fieldName = FieldNameEntry(
      index: fieldIndex,
      controller: fieldNameController,
    );

    return FieldModel(
      fieldName: fieldName,
      field: field,
      fieldNameController: fieldNameController,
      fieldController: fieldController,
    );
  }
}
