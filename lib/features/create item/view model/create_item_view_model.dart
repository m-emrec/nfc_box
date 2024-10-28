import 'package:flutter/material.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../model/field_model.dart';
import '../service/create_item_firebase_service.dart';

class CreateItemViewModel extends ChangeNotifier {
  final CreateItemFirebaseService _createItemFirebaseService;

  CreateItemViewModel(this._createItemFirebaseService);

  Future<DataState> createItem({
    required String itemName,
    required String image,
    required List<FieldModel> fields,
  }) async {
    final DataState dataState = await _createItemFirebaseService.createItem(
      itemName: itemName,
      image: image,
      fields: fields,
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
