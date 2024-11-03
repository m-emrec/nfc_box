import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/models/item.dart';
import '../service/item_list_database_service.dart';
import '../view%20model/item_list_view_model.dart';

mixin ItemListProvider {
  static final Provider<ItemListDatabaseService> _databaseServiceProvider =
      Provider<ItemListDatabaseService>((ref) {
    return ItemListDatabaseService();
  });

  final StateNotifierProvider<ItemListNotifier, List<Item>> itemListProvider =
      StateNotifierProvider<ItemListNotifier, List<Item>>(
    (ref) {
      return ItemListNotifier(ref.read(_databaseServiceProvider));
    },
  );
}
