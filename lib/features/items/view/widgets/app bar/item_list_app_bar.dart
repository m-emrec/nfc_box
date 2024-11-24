import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
import '../../../../../core/extensions/context_extension.dart';

import '../../../enums/sort_type.dart';
import '../../../providers/providers.dart';

part 'sort_button.dart';
part 'sort_order_button.dart';
part '../../../mixins/sort_button_mixin.dart';

class ItemListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WidgetRef ref;
  const ItemListAppBar({super.key, required this.ref});
  String get pageTitle => tr(LocaleKeys.item_pageTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(pageTitle),
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
