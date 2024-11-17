/// This file is part of the create_item_page.dart file.
/// It contains utility methods and properties for the CreateItem widget.
part of 'create_item_page.dart';

/// This class contains the properties for the CreateItem widget
mixin _CreateItemUtils on ConsumerState<CreateItemPage> {
  /// Constants
  final String addField = 'Add Field';
  final String enterItemName = 'Enter item name';
  final String addItem = 'Add Item';
  final String itemName = 'Item Name';

  /// Returns true if the widget is in edit mode (i.e., an existing item is being edited)
  bool get isEdit => widget.item != null;
  final TextEditingController imageController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();

  /// Lifecycle methods
  @override
  void initState() {
    if (isEdit) {
      WidgetsBinding.instance.addPostFrameCallback(_initializeEditState);
    }
    super.initState();
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

  ///
  /// Methods

  /// Initializes the edit state for the item being edited.
  ///
  /// This method sets the text of the `itemNameController` and `imageController`
  /// to the values of the item's name and image URL, respectively. It also calls
  /// `CreateItemProvider.getFieldsForUpdateItem` to update the fields for the item
  /// and triggers a state update.
  ///
  /// Args:
  ///   _ : A placeholder parameter, not used in the method.
  void _initializeEditState(_) {
    itemNameController.text = widget.item!.itemName ?? '';
    imageController.text = widget.item!.imageUrl ?? '';
    CreateItemProvider.getFieldsForUpdateItem(ref, widget.item!);
    setState(() {});
  }

  /// Saves the item by either creating a new one or updating an existing one.
  ///
  /// This method first validates the input fields. If the fields are valid,
  /// it proceeds to either create a new item or update an existing item
  /// based on the `isEdit` flag.
  ///
  /// If `isEdit` is true, it updates the existing item by calling `_callUpdateItem`.
  /// Otherwise, it creates a new item by calling `_callCreateItem`.
  ///
  /// The method is asynchronous and returns a `Future`.
  ///
  /// Parameters:
  /// - `context`: The build context.
  /// - `ref`: A reference to the widget.
  ///
  /// Returns:
  /// A `Future` that completes when the save operation is done.
  Future onSave(BuildContext context, WidgetRef ref) async {
    bool isValid = validate(context, ref);
    // if the fields are valid then create or update the item
    if (isValid) {
      if (isEdit) {
        await _callUpdateItem(widget.item!);
      } else {
        await _callCreateItem();
      }
    }
  }

  /// Calls the `createItem` method from `CreateItemProvider` to create a new item.
  ///
  /// The item is created using the data from `itemNameController`, `CreateItemProvider.fieldListProvider`,
  /// and `imageController`. If the creation is successful (i.e., `dataState` is `DataSuccess`),
  /// it fetches the updated list of items using `ItemListProvider` and pops the current screen if the context is still mounted.
  ///
  /// This method is asynchronous and returns a `Future<void>`.
  Future<void> _callCreateItem() async {
    await CreateItemProvider.createItem(
      ref,
      Item(
        itemName: itemNameController.text,
        fields: ref.watch(CreateItemProvider.fieldListProvider),
        imageUrl: imageController.text,
      ),
    ) // if the dataState is DataSuccess then pop the screen
        .then((dataState) async {
      if (dataState is DataSuccess) {
        await ref.read(ItemListProvider.itemListProvider.notifier).getItems();
        if (context.mounted) {
          context.pop();
        }
      }
    });
  }

  /// Updates an existing item by calling the `updateItem` method from `CreateItemProvider`.
  ///
  /// This method takes an `Item` object as a parameter, creates a new `Item` object with updated
  /// values from the respective controllers, and then calls the `updateItem` method. If the update
  /// is successful and the context is still mounted, it pops the current context.
  ///
  /// Parameters:
  /// - `item`: The `Item` object to be updated.
  ///
  /// Returns:
  /// A `Future<void>` indicating the completion of the update operation.
  Future<void> _callUpdateItem(Item item) async {
    final Item updatedItem = Item(
      id: item.id,
      itemName: itemNameController.text,
      fields: ref.watch(CreateItemProvider.fieldListProvider),
      imageUrl: imageController.text,
      createdDate: item.createdDate,
    );
    final DataState dataState = await CreateItemProvider.updateItem(
      ref,
      updatedItem,
    );
    if (dataState is DataSuccess) {
      if (context.mounted) {
        // context.pop("item");
        // ignore: use_build_context_synchronously
        context.goNamed(Routes.itemDetail.name, extra: updatedItem);
        // context.goNamed(Routes.itemDetail.name, extra: updatedItem);
      }
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

  /// Handles the addition of a new field by validating the input and showing a bottom sheet if valid.
  ///
  /// This function performs the following steps:
  /// 1. Validates the input using the `validate` function.
  /// 2. If the input is valid, it displays a bottom sheet using the `showBottomSheet` function.
  ///
  /// Parameters:
  /// - `context`: The BuildContext of the current widget.
  /// - `ref`: A reference to the widget's state.
  ///
  /// Returns:
  /// A Future that completes when the bottom sheet is closed.
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
