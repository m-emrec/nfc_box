import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/extensions/context_extension.dart';

import '../../../enums/sort_type.dart';
import '../../../providers/providers.dart';

part 'sort_button.dart';
part 'sort_order_button.dart';

class ItemListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WidgetRef ref;
  const ItemListAppBar({super.key, required this.ref});
  final String boxes = 'Boxes';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(boxes),
      actions: [
        /// Sort order button
        _SortOrderButton(ref: ref),

        /// Sort by button
        _SortButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
