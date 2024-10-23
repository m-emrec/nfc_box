import 'package:flutter/material.dart';

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
}
