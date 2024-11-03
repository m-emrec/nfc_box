part of 'create_item_page.dart';

/// This class contains the properties for the CreateItem widget
final class _CreateItemUtils with ItemListProvider, CreateItemProvider {
  static const String addField = 'Add Field';
  static const String addItem = 'Add Item';
  static const String itemName = 'Item Name';
  static TextEditingController imageController = TextEditingController();
  static TextEditingController itemNameController = TextEditingController();

  /// Clear the text fields and the fieldList
  void clear(WidgetRef ref) {
    ref.read(fieldListProvider).clear();
    itemNameController.clear();
    imageController.clear();
  }

  Future onSave(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);

    /// if the fields are valid then create the item
    if (isValid) {
      await ref
          .read(createItemProvider.notifier)
          .createItem(
            item: Item(
              itemName: itemNameController.text,
              fields: ref.watch(fieldListProvider),
              imageUrl: imageController.text,
            ),
          )

          /// if the dataState is DataSuccess then pop the screen
          .then((dataState) async {
        if (dataState is DataSuccess) {
          await ref.read(itemListProvider.notifier).getItems();
          if (context.mounted) {
            context.pop();
          }
        }
      });
    }
  }

  /// Validate the fields
  bool validate(BuildContext context, WidgetRef ref) {
    /// check if the fieldList is not empty
    if (ref.watch(fieldListProvider).isNotEmpty) {
      /// if the fieldList is not empty then check if the last field is empty
      final FieldModel lastField = ref.watch(fieldListProvider).last;
      if (lastField.fieldNameController.text.isEmpty ||
          lastField.fieldController.text.isEmpty) {
        /// if the last field is empty then show a error toast
        Toast.errToast(desc: 'Field name and field value cannot be empty');
        return false;
      }
    }

    /// check if the item name is empty
    if (itemNameController.text.isEmpty) {
      Toast.errToast(desc: 'Item name cannot be empty');
      return false;
    }

    /// if everything is valid then return true
    return true;
  }

  void onAddField(BuildContext context, WidgetRef ref) async {
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
