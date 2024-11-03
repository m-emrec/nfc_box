import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/logger.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../service/item_list_database_service.dart';

class ItemListNotifier extends StateNotifier<List<Item>> {
  final ItemListDatabaseService _itemListDatabaseService;
  ItemListNotifier(this._itemListDatabaseService) : super([]);

  Future getItems() async {
    await _itemListDatabaseService.fetchItems().then((value) {
      if (value is DataSuccess) {
        List<Item> items = [
          ...value.data.map((e) {
            return Item.fromJson(e.data());
          }).toList()
        ];
        state = [...items];
      }
    }).onError((error, stackTrace) {
      state = [];
      Toast.errToast(
        desc: AppErrorText.errorMessageConverter(
          error.toString(),
        ),
      );
    });
  }
}
