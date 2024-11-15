part of 'create_item_page.dart';

/// This class contains the properties for the CreateItem widget
mixin _CreateItemUtils on ConsumerState<CreateItemPage> {
  final String addField = 'Add Field';

  final String addItem = 'Add Item';

  final String itemName = 'Item Name';

  final TextEditingController imageController = TextEditingController();

  final TextEditingController itemNameController = TextEditingController();
  // final CreateItemProvider createItemProvider = CreateItemProvider.instance;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.item != null) {
        itemNameController.text = widget.item!.itemName ?? '';
        imageController.text = widget.item!.imageUrl ?? '';
        ref.read(CreateItemProvider.fieldListProvider.notifier).update(
          (state) {
            logger.i('Item fields: ${widget.item!.fields!.first.field}');
            widget.item!.fields!.map((field) {
              logger.i(field.field);

              /// A map of field types and their corresponding widgets.
              final TextEditingController fieldController =
                  TextEditingController();
              final Map fieldsMap = _fieldsMap(fieldController);
              fieldController.text = field.fieldController.text;
              final FieldModel fieldModel = field.copyWith(
                fieldName: field.fieldName,
                fieldNameController: fieldController,
                fieldType: field.fieldType,
                fieldID: field.fieldID ?? const Uuid().v1(),
                fieldController: fieldController,
                field: fieldsMap[field.fieldType],
              );
              state = [...state, fieldModel];
            }).toList();
            return state;
          },
        );
      }
    });

    super.initState();
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

  @override
  void deactivate() {
    ref.read(CreateItemProvider.fieldListProvider).clear();

    super.deactivate();
  }

  @override
  void dispose() {
    itemNameController.dispose();
    imageController.dispose();
    super.dispose();
  }

  Future onSave(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);

    /// if the fields are valid then create the item
    if (isValid) {
      await ref
          .read(CreateItemProvider.createItemProvider.notifier)
          .createItem(
            item: Item(
              itemName: itemNameController.text,
              fields: ref.watch(CreateItemProvider.fieldListProvider),
              imageUrl: imageController.text,
            ),
          )

          /// if the dataState is DataSuccess then pop the screen
          .then((dataState) async {
        if (dataState is DataSuccess) {
          await ref.read(ItemListProvider.itemListProvider.notifier).getItems();
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
    if (ref.watch(CreateItemProvider.fieldListProvider).isNotEmpty) {
      /// if the fieldList is not empty then check if the last field is empty
      final FieldModel lastField =
          ref.watch(CreateItemProvider.fieldListProvider).last;
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
  Future<void> showBottomSheet(
    BuildContext context,
  ) async {
    await CustomBottomSheet.show(
      context,
      widget: const ChooseFieldTypeSheet(),
    );
  }
}
