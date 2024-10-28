part of 'create_item_page.dart';

/// This class contains the properties for the CreateItem widget
final class _CreateItemUtils {
  static const String addField = 'Add Field';
  static const String addItem = 'Add Item';
  static const String itemName = 'Item Name';
  static TextEditingController imageController = TextEditingController();
  static TextEditingController itemNameController = TextEditingController();

  /// Clear the text fields and the fieldList
  static void clear(WidgetRef ref) {
    ref.read(fieldListProvider).clear();
    itemNameController.clear();
    imageController.clear();
  }

  static Future onSave(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);

    /// if the fields are valid then create the item
    if (isValid) {
      await ref
          .read(createItemProvider.notifier)
          .createItem(
            itemName: itemNameController.text,
            image: imageController.text,
            fields: ref.watch(fieldListProvider),
          )

          /// if the dataState is DataSuccess then pop the screen
          .then((dataState) {
        if (dataState is DataSuccess) {
          if (context.mounted) {
            context.pop();
          }
        }
      });
    }
  }

  /// Validate the fields
  /// if the fieldList is not empty then check if the last field is empty
  /// if the last field is empty then show a error toast
  /// check if the item name is empty
  /// if the item name is empty then show a error toast
  /// return true if all the fields are valid
  static bool validate(BuildContext context, WidgetRef ref) {
    /// check if the fieldList is not empty
    /// if the fieldList is not empty then check if the last field is empty
    /// if the last field is empty then show a error toast
    if (ref.watch(fieldListProvider).isNotEmpty) {
      final FieldModel lastField = ref.watch(fieldListProvider).last;
      if (lastField.fieldNameController.text.isEmpty ||
          lastField.fieldController.text.isEmpty) {
        Toast.errToast(desc: 'Field name and field value cannot be empty');
        return false;
      }
    }

    /// check if the item name is empty
    if (itemNameController.text.isEmpty) {
      Toast.errToast(desc: 'Item name cannot be empty');
      return false;
    }
    return true;
  }

  static void onAddField(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);
    if (isValid) {
      await showBottomSheet(context);
    }
  }

  /// Show [ChooseFieldTypeSheet] bottom sheet
  static Future<void> showBottomSheet(
    BuildContext context,
  ) async {
    await CustomBottomSheet.show(
      context,
      widget: const ChooseFieldTypeSheet(),
    );
  }
}
