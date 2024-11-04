import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../enums/sort_type.dart';
import '../../providers/providers.dart';

class ItemListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WidgetRef ref;
  const ItemListAppBar({super.key, required this.ref});
  final String boxes = 'Boxes';

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
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(boxes),
      actions: [
        /// Sort order button
        IconButton(
          onPressed: () {
            ItemListProvider.changeSortOrder(ref);
          },
          icon: Icon(
            ItemListProvider.isDescending(ref)
                ? Icons.arrow_upward_sharp
                : Icons.arrow_downward_sharp,
          ),
        ),

        /// Sort by button
        const SortButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SortButton extends ConsumerStatefulWidget {
  const SortButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends ConsumerState<SortButton> {
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
    return PopupMenuButton(
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
    );
  }
}
