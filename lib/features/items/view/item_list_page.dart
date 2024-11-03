import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/logger.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/routes/router.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/models/item.dart';
import '../providers/providers.dart';
import 'widgets/item card/item_card.dart';
import 'widgets/item_list.dart';

class ItemListPage extends ConsumerStatefulWidget {
  const ItemListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemListPage> {
  static const String boxes = 'Boxes';

  @override
  void initState() {
    ref.read(ItemListProvider.itemListProvider.notifier).getItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading =
        ref.watch(ItemListProvider.itemListProvider.notifier).isLoading;
    logger.i(isLoading);
    final List<Item> items = ref.watch(ItemListProvider.itemListProvider);
    logger.w(items.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text(boxes),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.createItem.name),
        child: const Icon(Icons.add),
      ),
      body: isLoading ? _LoadingList() : ItemList(items: items),
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
