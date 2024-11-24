import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/utils/models/item.dart';
import '../../../../core/utils/widgets/item card/item_card.dart';
import '../../providers/providers.dart';

class ItemList extends ConsumerWidget {
  const ItemList({
    super.key,
    required this.items,
  });

  final List<Item> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String noItemsFound = tr(LocaleKeys.item_noItemsText);

    if (items.isEmpty) {
      return Center(
        child: Text(noItemsFound),
      );
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final Item item = items[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppPaddings.sPadding / 2,
            horizontal: AppPaddings.xsPadding,
          ),
          child: ItemCard(
            item: item,
            removeAction: () => ref
                .read(ItemListProvider.itemListProvider.notifier)
                .removeItem(item),
          ),
        );
      },
    );
  }
}
