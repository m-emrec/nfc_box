import 'package:flutter/material.dart';
import 'package:nfc_box/core/utils/models/item.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../../../core/utils/models/field_model.dart';
import '../service/create_item_firebase_service.dart';

class CreateItemViewModel extends ChangeNotifier {
  final CreateItemDatabaseService _createItemFirebaseService;

  CreateItemViewModel(this._createItemFirebaseService);

  Future<DataState> createItem({
    required Item item,
  }) async {
    final DataState dataState = await _createItemFirebaseService.createItem(
      item: item,
    );
    if (dataState is DataSuccess) {
      Toast.succToast(title: 'Item created successfully');
      return DataSuccess(null);
    } else {
      Toast.errToast(
        title: 'Failed to create item',
        desc: AppErrorText.errorMessageConverter(dataState.exception),
      );
      return DataFailed(null);
    }
  }
}
