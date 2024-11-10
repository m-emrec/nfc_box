part of tag_detail_view;

class _ItemList extends StatelessWidget {
  final List<Item> items;
  const _ItemList({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[index],
            // onTap: () {},
          );
        });
  }
}
