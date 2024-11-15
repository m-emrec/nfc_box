part of 'add_item_bottom_sheet.dart';

class _LoadedListOfItems extends StatefulWidget {
  final List<Item> items;
  const _LoadedListOfItems({required this.items});

  @override
  State<_LoadedListOfItems> createState() => _LoadedListOfItemsState();
}

class _LoadedListOfItemsState extends State<_LoadedListOfItems>
    with _LoadedListOfItemsMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _AddItemTextButton(selectedItems: selectedItems),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return _TagDetailItemCard(
              onItemTap: _onItemTap,
              selectedItems: selectedItems,
              item: widget.items[index],
            );
          },
        ),
      ],
    );
  }
}
