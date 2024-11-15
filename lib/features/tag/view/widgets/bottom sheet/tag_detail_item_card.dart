part of 'add_item_bottom_sheet.dart';

class _TagDetailItemCard extends StatelessWidget {
  final Function onItemTap;
  final List<Item> selectedItems;
  final Item item;
  const _TagDetailItemCard({
    required this.onItemTap,
    required this.selectedItems,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTap(item),
      child: Badge(
        isLabelVisible: selectedItems.contains(item),
        offset: const Offset(0, 0),
        backgroundColor: AppColors.accentSuccess[90],
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(AppPaddings.xxsPadding),
        label: const Text("Selected"),
        child: ItemCard(
          item: item,
        ),
      ),
    );
  }
}
