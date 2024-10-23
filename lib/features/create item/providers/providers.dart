import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/field_model.dart';
import '../model/create_item_model.dart';

/// This provider used to store [FieldModel]
final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
  return [];
});

/// I use this provider to hold [CreateItemModel]
final itemProvider = StateProvider<CreateItemModel>((ref) {
  return CreateItemModel();
});
