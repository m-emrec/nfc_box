part of '../view/widgets/bottom sheet/add_item_bottom_sheet.dart';

// ignore: library_private_types_in_public_api
mixin _LoadedListOfItemsMixin on State<_LoadedListOfItems> {
  /// List of selected items
  List<Item> selectedItems = [];

  /// Handle the tap event on the item
  void _onItemTap(Item item) {
    setState(() {
      /// If the item is already selected, remove it from the list
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);

        /// If the item is not selected, add it to the list
      } else {
        selectedItems.add(item);
      }
    });
  }
}
