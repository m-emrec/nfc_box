import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
import 'package:nfc_box/core/utils/models/item.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../service/create_item_firebase_service.dart';

class CreateItemViewModel extends ChangeNotifier {
  final CreateItemDatabaseService _createItemFirebaseService;

  CreateItemViewModel(this._createItemFirebaseService);

  /// This method creates a new item to upload to the database.
  Future<DataState> createItem({
    required Item item,
  }) async {
    final DataState dataState = await _createItemFirebaseService.createItem(
      item: item,
    );
    if (dataState is DataSuccess) {
      Toast.succToast(title: tr(LocaleKeys.createItem_success_itemCreated));
      return DataSuccess(null);
    } else {
      Toast.errToast(
        title: tr(LocaleKeys.createItem_errors_failedToCreateItem),
        desc: AppErrorText.errorMessageConverter(dataState.exception),
      );
      return DataFailed(null);
    }
  }

  /// This method updates the item in the database
  Future<DataState> updateItem({
    required Item item,
  }) async {
    final DataState dataState = await _createItemFirebaseService.updateItem(
      item: item,
    );
    if (dataState is DataSuccess) {
      Toast.succToast(title: tr(LocaleKeys.createItem_success_itemUpdated));
      return DataSuccess(dataState.data);
    } else {
      Toast.errToast(
        title: tr(LocaleKeys.createItem_errors_failedToUpdateItem),
        desc: AppErrorText.errorMessageConverter(dataState.exception),
      );
      return DataFailed(null);
    }
  }
}
