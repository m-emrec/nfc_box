import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/enums/item_field_names.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/models/field_model.dart';
import '../../../core/utils/models/item.dart';
import '../service/create_item_firebase_service.dart';
import '../view%20model/create_item_view_model.dart';
import '../view/widgets/fields/color field/color_field.dart';
import '../view/widgets/fields/date field entry/date_field_entry.dart';
import '../view/widgets/fields/text_field_entry.dart';

class CreateItemProvider {
  CreateItemProvider._();

  /// This provider used to store a list of [FieldModel]
  static final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
    return [];
  });

  /// Firebase service provider
  static final _createItemFirebaseServiceProvider =
      Provider<CreateItemDatabaseService>((ref) {
    return CreateItemDatabaseService();
  });

  /// [CreateItemViewModel] provider
  static final createItemProvider =
      ChangeNotifierProvider<CreateItemViewModel>((ref) {
    return CreateItemViewModel(ref.watch(_createItemFirebaseServiceProvider));
  });

  /////        Methods                                                   /////

  /// This method provides a shortcut to create an item.
  static Future<DataState> createItem(WidgetRef ref, Item item) {
    return ref
        .read(CreateItemProvider.createItemProvider.notifier)
        .createItem(item: item);
  }

  /// This method provides a shortcut to update an item.
  static Future<DataState> updateItem(WidgetRef ref, Item item) {
    return ref.read(CreateItemProvider.createItemProvider.notifier).updateItem(
          item: item,
        );
  }

  /// if the item is being updated, this method will get the fields of the item.
  static void getFieldsForUpdateItem(WidgetRef ref, Item item) {
    ref.read(CreateItemProvider.fieldListProvider.notifier).update(
      (state) {
        item.fields!.map((field) {
          final TextEditingController fieldNameController =
              TextEditingController(
            text: field.fieldNameController.text,
          );

          final TextEditingController fieldController =
              TextEditingController(text: field.fieldController.text);

          /// A map of field types and their corresponding widgets.
          Map fieldsMap = {
            ItemFieldNames.Color: ColorField(
              controller: fieldController,
            ),
            ItemFieldNames.Text: TextFieldEntry(
              controller: fieldController,
            ),
            ItemFieldNames.Date: DateFieldEntry(
              controller: fieldController,
            ),
          };
          // create a field model
          final FieldModel fieldModel = FieldModel.createModel(
            fieldNameController: fieldNameController,
            fieldType: field.fieldType,
            fieldID: field.fieldID ?? const Uuid().v1(),
            fieldController: fieldController,
            field: fieldsMap[field.fieldType],
          );
          // add the field model to the state
          state = [...state, fieldModel];
        }).toList();
        return state;
      },
    );
  }
}
