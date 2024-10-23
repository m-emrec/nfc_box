import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/features/create%20item/model/field_model.dart';
import 'package:nfc_box/features/create%20item/model/item.dart';

final fieldListProvider = StateProvider<List<FieldModel>>((ref) {
  return [];
});

final itemProvider = StateProvider<CreateItemModel>((ref) {
  return CreateItemModel();
});
