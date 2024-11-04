part of 'item_list_appbar.dart';

class _SortButton extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends ConsumerState<_SortButton> {
  void popMenuButtonOnSelected(value) {
    switch (value) {
      case SortType.date:
        ItemListProvider.sortByCreatedDate(ref);
        break;
      case SortType.name:
        ItemListProvider.sortByName(ref);
        break;
      case SortType.fieldCount:
        ItemListProvider.sortByFieldCount(ref);
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
    return Badge(
      label: Text(ItemListProvider.isDescending(ref).toString()),
      alignment: Alignment.center,
      child: PopupMenuButton(
        initialValue: SortType.date,
        icon: const Icon(Icons.sort),
        position: PopupMenuPosition.under,
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
      ),
    );
  }
}
