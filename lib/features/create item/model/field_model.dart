import 'package:flutter/material.dart';

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
