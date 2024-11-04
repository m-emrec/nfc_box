import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../view/item_list_page.dart';

mixin ItemListPageMixin on ConsumerState<ItemListPage> {
  @override
  void initState() {
    ItemListProvider.getItems(ref);
    super.initState();
  }
}
