import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/models/item.dart';
import 'item card/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.items,
  });

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return _LoadingList();
    }
    return ListView.builder(
      addAutomaticKeepAlives: true,
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
          ),
        );
      },
    );
  }
}

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Skeletonizer(
          containersColor: AppColors.neutralBackgroundLight[50],
          enabled: true, // items.isEmpty,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPaddings.sPadding / 2,
              horizontal: AppPaddings.xsPadding,
            ),
            child: ItemCard(
              item: Item(
                itemName: 'Loading...',
                id: 'Loading...',
                imageUrl: '',
                createdDate: DateTime.now(),
              ),
            ),
          ),
        );
      },
    );
  }
}
