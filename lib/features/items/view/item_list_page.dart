import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../config/routes/router.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/utils/models/item.dart';
import '../mixins/item_list_page_mixin.dart';
import '../providers/providers.dart';
import 'widgets/item card/item_card.dart';
import 'widgets/item_list.dart';
import 'widgets/app bar/item_list_app_bar.dart';
part 'widgets/_loading_list.dart';

class ItemListPage extends ConsumerStatefulWidget {
  const ItemListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemListPage>
    with ItemListPageMixin {
  @override
  Widget build(BuildContext context) {
    bool isLoading = ItemListProvider.isLoading(ref);
    final List<Item> items = ItemListProvider.items(ref);
    return Scaffold(
      appBar: ItemListAppBar(ref: ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.createItem.name),
        child: const Icon(Icons.add),
      ),
      body: isLoading ? _LoadingList() : ItemList(items: items),
    );
  }
}
