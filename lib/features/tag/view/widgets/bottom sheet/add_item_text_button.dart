part of 'add_item_bottom_sheet.dart';

class _AddItemTextButton extends ConsumerWidget {
  const _AddItemTextButton({
    required this.selectedItems,
  });

  final List<Item> selectedItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: selectedItems.isNotEmpty,
      child: TextButton(
        onPressed: () {
          TagDetailProviders.addItemToTag(ref, selectedItems);
          context.pop();
        },
        child: Text(tr(LocaleKeys.tag_add)),
      ),
    );
  }
}
