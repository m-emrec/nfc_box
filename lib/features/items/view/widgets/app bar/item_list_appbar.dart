import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../enums/sort_type.dart';
import '../../../providers/providers.dart';

part 'sort_button.dart';

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
      // actions: [
      //   /// Sort order button
      //   IconButton(
      //     onPressed: () {
      //       ItemListProvider.changeSortOrder(ref);
      //     },
      //     icon: Icon(
      //       ItemListProvider.isDescending(ref)
      //           ? Icons.arrow_upward_sharp
      //           : Icons.arrow_downward_sharp,
      //     ),
      //   ),

      //   /// Sort by button
      //   const SortButton(),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
