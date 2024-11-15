part of "../tag_detail_view.dart";

class _ItemList extends ConsumerWidget {
  final List<Item> items;
  const _ItemList({
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[index],
            removeAction: () {
              TagDetailProviders.removeItemFromTag(ref, items[index]);
            },
          );
        });
  }
}
