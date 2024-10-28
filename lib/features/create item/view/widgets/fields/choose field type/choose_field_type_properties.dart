part of 'choose_field_type_sheet.dart';

/// A class that contains the properties of the [ChooseFieldTypeSheet] widget.
final class _ChooseFieldTypeSheetUtils {
  static const List<FieldNames> _fieldNames = FieldNames.values;

  /// Handles the event when a field type is selected.
  ///
  /// This method is triggered when a user selects a field type from the available options.
  /// It performs the necessary actions based on the selected field type.
  static void onSelected(
    BuildContext context, {
    required WidgetRef ref,
    required FieldNames fieldName,
  }) {
    /// A controller for the field.
    final TextEditingController fieldController = TextEditingController();

    /// The index of the field in the list of fields.
    final int fieldIndex = ref.watch(fieldListProvider).length + 1;

    /// A map of field types and their corresponding widgets.
    final Map fieldsMap = _fieldsMap(fieldController);

    _updateFieldList(
      ref,
      FieldModel.createModel(
        fieldType: fieldName,
        fieldIndex: fieldIndex,
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
  static void _updateFieldList(
    WidgetRef ref,
    FieldModel fieldModel,
  ) {
    ref.read(fieldListProvider.notifier).update(
          (list) => [...list, fieldModel],
        );
  }

  /// Returns a map of field types and their corresponding widgets.
  static Map _fieldsMap(TextEditingController fieldController) {
    final Map fieldsMap = {
      FieldNames.Color: ColorField(
        controller: fieldController,
      ),
      FieldNames.Text: TextFieldEntry(
        controller: fieldController,
      ),
      FieldNames.Date: DateFieldEntry(
        controller: fieldController,
      ),
    };
    return fieldsMap;
  }
}
