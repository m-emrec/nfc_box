import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/models/item.dart';
import '../service/item_list_database_service.dart';
import '../view%20model/item_list_view_model.dart';

class ItemListProvider {
  static final Provider<ItemListDatabaseService> _databaseServiceProvider =
      Provider<ItemListDatabaseService>((ref) {
    return ItemListDatabaseService();
  });
  static final itemListProvider =
      StateNotifierProvider.autoDispose<ItemListNotifier, List<Item>>(
    (ref) {
      return ItemListNotifier(ref.read(_databaseServiceProvider));
    },
  );

  /// Dependencies
  static bool isDescending(WidgetRef ref) =>
      ref.watch(itemListProvider.notifier).descending;
  static bool isLoading(WidgetRef ref) =>
      ref.watch(ItemListProvider.itemListProvider.notifier).isLoading;
  static List<Item> items(WidgetRef ref) =>
      ref.watch(ItemListProvider.itemListProvider);

  /// Actions
  static changeSortOrder(WidgetRef ref) =>
      ref.read(ItemListProvider.itemListProvider.notifier).changeSortOrder();
  static sortByFieldCount(WidgetRef ref) =>
      ref.read(ItemListProvider.itemListProvider.notifier).sortByFieldCount();

  static sortByCreatedDate(WidgetRef ref) =>
      ref.read(ItemListProvider.itemListProvider.notifier).sortByCreatedDate();
  static sortByName(WidgetRef ref) =>
      ref.read(ItemListProvider.itemListProvider.notifier).sortByName();
  static getItems(WidgetRef ref) =>
      ref.read(ItemListProvider.itemListProvider.notifier).getItems();
}
