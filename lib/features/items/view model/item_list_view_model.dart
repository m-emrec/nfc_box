import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../service/item_list_database_service.dart';

class ItemListNotifier extends StateNotifier<List<Item>> {
  final ItemListDatabaseService _itemListDatabaseService;
  ItemListNotifier(this._itemListDatabaseService) : super([]) {
    descending = false;
    sortByCreatedDate();
  }
  bool isLoading = false;
  bool descending = false;

  Future<void> removeItem(Item item) async {
    await _itemListDatabaseService.removeItem(item).then((value) {
      if (value is DataSuccess) {
        state = state.where((element) => element.id != item.id).toList();
      }
    }).onError((error, stackTrace) {
      Toast.errToast(
        desc: AppErrorText.errorMessageConverter(
          error.toString(),
        ),
      );
    });
  }

  Future<void> getItems() async {
    isLoading = true;

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
    isLoading = false;
  }

  void changeSortOrder() {
    descending = !descending;
    state = [...state.reversed];
  }

  void sortByCreatedDate() {
    state.sort(
      (a, b) {
        if (a.createdDate != null && b.createdDate != null) {
          if (descending) {
            return b.createdDate!.compareTo(
              a.createdDate!,
            );
          } else {
            return a.createdDate!.compareTo(b.createdDate!);
          }
        }
        return 0;
      },
    );
    state = [...state];
  }

  void sortByFieldCount() {
    state.sort(
      (a, b) {
        if (a.fields != null && b.fields != null) {
          if (descending) {
            return b.fields!.length.compareTo(
              a.fields!.length,
            );
          } else {
            return a.fields!.length.compareTo(b.fields!.length);
          }
        }
        return 0;
      },
    );
    state = [...state];
  }

  void sortByName() {
    state.sort(
      (a, b) {
        if (a.itemName != null && b.itemName != null) {
          if (descending) {
            return b.itemName!.compareTo(
              a.itemName!,
            );
          } else {
            return a.itemName!.compareTo(b.itemName!);
          }
        }
        return 0;
      },
    );
    state = [...state];
  }
}
