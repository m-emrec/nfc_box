part of 'add_item_bottom_sheet.dart';

class _LoadedListOfItems extends StatelessWidget {
  final List<Item> items;
  const _LoadedListOfItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Badge(
            alignment: Alignment.centerRight,
            child: ItemCard(
              item: items[index],
            ),
          ),
        );
      },
    );
  }
}
