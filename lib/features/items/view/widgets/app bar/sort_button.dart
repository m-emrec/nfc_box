part of 'item_list_appbar.dart';

class _SortButton extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends ConsumerState<_SortButton> {
  SortType initialValue = SortType.date;
  void popMenuButtonOnSelected(value) {
    switch (value) {
      case SortType.date:
        ItemListProvider.sortByCreatedDate(ref);
        setState(() {
          initialValue = SortType.date;
        });
        break;
      case SortType.name:
        ItemListProvider.sortByName(ref);
        setState(() {
          initialValue = SortType.name;
        });
        break;
      case SortType.fieldCount:
        ItemListProvider.sortByFieldCount(ref);
        setState(() {
          initialValue = SortType.fieldCount;
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
