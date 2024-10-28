// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:nfc_box/features/create%20item/enums/field_names.dart';

import '../view/widgets/fields/color_field.dart';
import '../view/widgets/fields/date_field_entry.dart';
import '../view/widgets/fields/field_name_entry.dart';
import '../view/widgets/fields/text_field_entry.dart';

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
  final int? fieldIndex;
  final FieldNames fieldType;
  FieldModel({
    required this.fieldName,
    required this.field,
    required this.fieldNameController,
    required this.fieldController,
    this.fieldIndex,
    required this.fieldType,
  });

  factory FieldModel.createModel({
    required int fieldIndex,
    required Widget field,
    required TextEditingController fieldController,
    required FieldNames fieldType,
  }) {
    final TextEditingController fieldNameController = TextEditingController();

    final Widget fieldName = FieldNameEntry(
      index: fieldIndex,
      controller: fieldNameController,
    );

    return FieldModel(
      fieldIndex: fieldIndex,
      fieldName: fieldName,
      field: field,
      fieldNameController: fieldNameController,
      fieldController: fieldController,
      fieldType: fieldType,
    );
  }

  FieldModel copyWith({
    Widget? fieldName,
    Widget? field,
    TextEditingController? fieldNameController,
    TextEditingController? fieldController,
    int? fieldIndex,
    FieldNames? fieldType,
  }) {
    return FieldModel(
      fieldName: fieldName ?? this.fieldName,
      field: field ?? this.field,
      fieldNameController: fieldNameController ?? this.fieldNameController,
      fieldController: fieldController ?? this.fieldController,
      fieldIndex: fieldIndex ?? this.fieldIndex,
      fieldType: fieldType ?? this.fieldType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'fieldName': fieldName.toMap(),
      // 'field': field.toMap(),
      'fieldNameController': fieldNameController.text,
      'fieldController': fieldController.text,
      'fieldIndex': fieldIndex,
      'fieldType': fieldType.name,
    };
  }

  factory FieldModel.fromMap(Map<String, dynamic> map) {
    final Map fieldsMap = {
      FieldNames.Color: ColorField(
        controller:
            TextEditingController(text: map['fieldController'] as String),
      ),
      FieldNames.Text: TextFieldEntry(
        controller:
            TextEditingController(text: map['fieldController'] as String),
      ),
      FieldNames.Date: DateFieldEntry(
        controller:
            TextEditingController(text: map['fieldController'] as String),
      ),
    };
    return FieldModel(
      fieldName: FieldNameEntry(
        controller:
            TextEditingController(text: map['fieldNameController'] as String),
      ),
      field: fieldsMap[FieldNames.values.firstWhere(
        (FieldNames e) => e.name == map['fieldType'] as String,
      )],
      fieldNameController:
          TextEditingController(text: map['fieldNameController'] as String),
      fieldController:
          TextEditingController(text: map['fieldController'] as String),
      fieldIndex: map['fieldIndex'] as int,
      fieldType: FieldNames.values.firstWhere(
        (FieldNames e) => e.name == map['fieldType'] as String,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  // factory FieldModel.fromJson(String source) =>
  //     FieldModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FieldModel(fieldName: $fieldName, field: $field, fieldNameController: $fieldNameController, fieldController: $fieldController, fieldIndex: $fieldIndex, fieldType: $fieldType)';
  }

  @override
  bool operator ==(covariant FieldModel other) {
    if (identical(this, other)) return true;

    return other.fieldName == fieldName &&
        other.field == field &&
        other.fieldNameController == fieldNameController &&
        other.fieldController == fieldController &&
        other.fieldIndex == fieldIndex &&
        other.fieldType == fieldType;
  }

  @override
  int get hashCode {
    return fieldName.hashCode ^
        field.hashCode ^
        fieldNameController.hashCode ^
        fieldController.hashCode ^
        fieldIndex.hashCode ^
        fieldType.hashCode;
  }
}
