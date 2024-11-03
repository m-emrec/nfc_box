import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/models/field_model.dart';
import '../service/create_item_firebase_service.dart';
import '../view%20model/create_item_view_model.dart';

class CreateItemProvider {
  CreateItemProvider._();

  // / change  all provider mixins to singletons
  // static final instance = CreateItemProvider._();

  /// This provider used to store [FieldModel]
  static final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
    return [];
  });

  static final _createItemFirebaseServiceProvider =
      Provider<CreateItemDatabaseService>((ref) {
    return CreateItemDatabaseService();
  });

  static final createItemProvider =
      ChangeNotifierProvider<CreateItemViewModel>((ref) {
    return CreateItemViewModel(ref.watch(_createItemFirebaseServiceProvider));
  });
}
