import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/create_item_model.dart';
import '../../../core/utils/models/field_model.dart';
import '../service/create_item_firebase_service.dart';
import '../view%20model/create_item_view_model.dart';

/// This provider used to store [FieldModel]
final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
  return [];
});

/// I use this provider to hold [CreateItemModel]
final itemProvider = StateProvider<CreateItemModel>((ref) {
  return CreateItemModel();
});

final _createItemFirebaseServiceProvider =
    Provider<CreateItemFirebaseService>((ref) {
  return CreateItemFirebaseService();
});

final createItemProvider = ChangeNotifierProvider<CreateItemViewModel>((ref) {
  return CreateItemViewModel(ref.watch(_createItemFirebaseServiceProvider));
});
