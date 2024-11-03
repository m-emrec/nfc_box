import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/models/field_model.dart';
import '../service/create_item_firebase_service.dart';
import '../view%20model/create_item_view_model.dart';

mixin CreateItemProvider {
  /// This provider used to store [FieldModel]
  final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
    return [];
  });

  static final _createItemFirebaseServiceProvider =
      Provider<CreateItemDatabaseService>((ref) {
    return CreateItemDatabaseService();
  });

  final createItemProvider = ChangeNotifierProvider<CreateItemViewModel>((ref) {
    return CreateItemViewModel(ref.watch(_createItemFirebaseServiceProvider));
  });
}

// /// This provider used to store [FieldModel]
// final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
//   return [];
// });

// final _createItemFirebaseServiceProvider =
//     Provider<CreateItemDatabaseService>((ref) {
//   return CreateItemDatabaseService();
// });

// final createItemProvider = ChangeNotifierProvider<CreateItemViewModel>((ref) {
//   return CreateItemViewModel(ref.watch(_createItemFirebaseServiceProvider));
// });
