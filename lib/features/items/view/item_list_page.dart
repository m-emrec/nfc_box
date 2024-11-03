import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes/router.dart';

import '../../../core/utils/models/item.dart';
import '../providers/providers.dart';
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
    ref.read(itemListProvider.notifier).getItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Item> items = ref.watch(itemListProvider);
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
      body: ItemList(items: items),
    );
  }
}
