import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/logger.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../service/item_list_database_service.dart';

class ItemListNotifier extends ChangeNotifier {
  final ItemListDatabaseService _itemListDatabaseService;
  ItemListNotifier(this._itemListDatabaseService) {
    // sortByCreatedDate();
  }
  bool isLoading = false;
  bool descending = false;
  List<Item> itemList = [];
  Future<void> removeItem(Item item) async {
    await _itemListDatabaseService.removeItemFromDatabase(item).then((value) {
      if (value is DataSuccess) {
        itemList = itemList.where((element) => element.id != item.id).toList();
      }
    }).onError((error, stackTrace) {
      Toast.errToast(
        desc: AppErrorText.errorMessageConverter(
          error.toString(),
        ),
      );
    });
    notifyListeners();
  }

  Future<void> getItems() async {
    isLoading = true;
    notifyListeners();
    await _itemListDatabaseService.fetchItems().then((value) {
      /// If the data is successfully fetched, convert it to a list of items
      if (value is DataSuccess) {
        List<Item> items = _convertDataToList(value);

        itemList = items;
      }
    }).onError((error, stackTrace) {
      itemList = [];
      Toast.errToast(
        desc: AppErrorText.errorMessageConverter(
          error.toString(),
        ),
      );
    });
    isLoading = false;
    notifyListeners();
  }

  /// convert the data to a list of items
  List<Item> _convertDataToList(DataSuccess value) {
    return value.data.map<Item>((e) {
      return Item.fromJson(e.data());
    }).toList();
  }

  /// This function changes the sort order of the list
  void changeSortOrder() {
    descending = !descending;

    itemList = [...itemList.reversed];
    notifyListeners();
  }

  void sortByCreatedDate() {
    itemList.sort(
      (a, b) {
        if (a.createdDate != null && b.createdDate != null) {
          if (descending) {
            return a.createdDate!.compareTo(
              b.createdDate!,
            );
          } else {
            return b.createdDate!.compareTo(a.createdDate!);
          }
        }
        return 0;
      },
    );
    itemList = [...itemList];
    notifyListeners();
  }

  void sortByFieldCount() {
    itemList.sort(
      (a, b) {
        if (a.fields != null && b.fields != null) {
          if (descending) {
            return a.fields!.length.compareTo(
              b.fields!.length,
            );
          } else {
            return b.fields!.length.compareTo(a.fields!.length);
          }
        }
        return 0;
      },
    );
    itemList = [...itemList];
    notifyListeners();
  }

  void sortByName() {
    itemList.sort(
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
    itemList = [...itemList];
    notifyListeners();
  }
}
