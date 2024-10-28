// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../constants/enums/item_doc_keys.dart';
import '../../constants/enums/item_field_names.dart';
import '../../../features/create item/view/widgets/fields/color field/color_field.dart';
import '../../../features/create item/view/widgets/fields/date field entry/date_field_entry.dart';
import '../../../features/create item/view/widgets/fields/field_name_entry.dart';
import '../../../features/create item/view/widgets/fields/text_field_entry.dart';

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
  final ItemFieldNames fieldType;
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
    required ItemFieldNames fieldType,
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
    ItemFieldNames? fieldType,
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
      ItemDocKeys.fieldName.name: fieldNameController.text,
      ItemDocKeys.fieldValue.name: fieldController.text,
      ItemDocKeys.fieldType.name: fieldType.name,
    };
  }

  factory FieldModel.fromMap(Map<String, dynamic> map) {
    final Map fieldsMap = {
      ItemFieldNames.Color: ColorField(
        controller: TextEditingController(
            text: map[ItemDocKeys.fieldValue.name] as String),
      ),
      ItemFieldNames.Text: TextFieldEntry(
        controller: TextEditingController(
            text: map[ItemDocKeys.fieldValue.name] as String),
      ),
      ItemFieldNames.Date: DateFieldEntry(
        controller: TextEditingController(
            text: map[ItemDocKeys.fieldValue.name] as String),
      ),
    };
    return FieldModel(
      fieldName: FieldNameEntry(
        controller: TextEditingController(
            text: map[ItemDocKeys.fieldName.name] as String),
      ),
      field: fieldsMap[ItemFieldNames.values.firstWhere(
        (ItemFieldNames e) =>
            e.name == map[ItemDocKeys.fieldType.name] as String,
      )],
      fieldNameController: TextEditingController(
          text: map[ItemDocKeys.fieldName.name] as String),
      fieldController: TextEditingController(
          text: map[ItemDocKeys.fieldValue.name] as String),
      fieldType: ItemFieldNames.values.firstWhere(
        (ItemFieldNames e) =>
            e.name == map[ItemDocKeys.fieldType.name] as String,
      ),
    );
  }
}
