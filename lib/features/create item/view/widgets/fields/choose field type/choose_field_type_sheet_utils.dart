part of 'choose_field_type_sheet.dart';

/// A class that contains the properties of the [ChooseFieldTypeSheet] widget.
final class _ChooseFieldTypeSheetUtils {
  static const List<ItemFieldNames> _fieldNames = ItemFieldNames.values;
  // final CreateItemProvider createItemProvider = CreateItemProvider.instance;

  /// Handles the event when a field type is selected.
  ///
  /// This method is triggered when a user selects a field type from the available options.
  /// It performs the necessary actions based on the selected field type.
  void onSelected(
    BuildContext context, {
    required WidgetRef ref,
    required ItemFieldNames fieldName,
  }) {
    /// A controller for the field.
    final TextEditingController fieldController = TextEditingController();

    /// The index of the field in the list of fields.
    final String fieldID = const Uuid().v1();

    /// A map of field types and their corresponding widgets.
    final Map fieldsMap = _fieldsMap(fieldController);

    _updateFieldList(
      ref,
      FieldModel.createModel(
        fieldType: fieldName,
        fieldID: fieldID,
        fieldController: fieldController,
        field: fieldsMap[fieldName],
      ),
    );

    context.pop();
  }

  /// Updates the list of fields with the selected field type
  ///
  /// This function takes a list of fields and a selected field type as input.
  /// It updates each field in the list to match the selected field type.
  void _updateFieldList(
    WidgetRef ref,
    FieldModel fieldModel,
  ) {
    ref.read(CreateItemProvider.fieldListProvider.notifier).update(
          (list) => [...list, fieldModel],
        );
  }

  /// Returns a map of field types and their corresponding widgets.
  static Map _fieldsMap(TextEditingController fieldController) {
    final Map fieldsMap = {
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
    return fieldsMap;
  }
}
