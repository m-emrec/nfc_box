part of 'item_list_app_bar.dart';

class _SortButton extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends ConsumerState<_SortButton>
    with _SortButtonMixin {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: initialValue,
      icon: const Icon(Icons.sort),
      onSelected: popMenuButtonOnSelected,
      itemBuilder: (context) {
        return [
          ...List.generate(SortType.values.length, (index) {
            return PopupMenuItem(
              value: SortType.values[index],
              child: Row(
                children: [
                  Text(SortType.values[index].label),
                ],
              ),
            );
          })
        ];
      },
    );
  }
}
