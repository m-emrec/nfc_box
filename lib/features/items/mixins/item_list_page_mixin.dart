import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../view/item_list_page.dart';

mixin ItemListPageMixin on ConsumerState<ItemListPage> {
  @override
  void initState() {
    ref.read(ItemListProvider.itemListProvider.notifier).getItems();

    super.initState();
  }
}
