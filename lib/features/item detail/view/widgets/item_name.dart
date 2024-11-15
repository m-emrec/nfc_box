part of '../item_detail_view.dart';

class _ItemName extends StatelessWidget {
  const _ItemName({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Text(
      item.itemName ?? "",
      style: context.textTheme.titleLarge,
    );
  }
}
