import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import 'package:nfc_box/core/utils/models/tag.dart';
import 'package:nfc_box/features/tag/services/fetch_items_from_database_service.dart';
import '../../../core/utils/models/item.dart';
import '../view%20model/tag_detail_view_model.dart';

final class TagDetailProviders {
  factory TagDetailProviders(Tag tag) {
    return TagDetailProviders._(tag);
  }
  final Tag initialTag;
  TagDetailProviders._(this.initialTag) {
    _tag = initialTag;
  }
  static late Tag _tag;

  static final itemListProvider =
      FutureProvider.autoDispose<DataState>((ref) async {
    final DataState dataState =
        await FetchItemsFromDatababaseService().fetchItems();
    if (dataState is DataSuccess) {
      final List<Item> itemList =
          dataState.data.map<Item>((e) => Item.fromJson(e.data())).toList();
      return DataSuccess<List<Item>>(itemList);
    }
    return DataFailed(dataState.exception);
  });

  static final tagDetailViewModelProvider =
      StateNotifierProvider.autoDispose<TagDetailViewModel, Tag>((ref) {
    return TagDetailViewModel(_tag);
  });

  /// if the tag is edited this will be true
  /// and the save button will be enabled
  static final isEditedProvider = StateProvider.autoDispose<bool>((ref) {
    bool isEdited = _tag != ref.watch(tagDetailViewModelProvider);
    return isEdited;
  });

  /// Methods
  ///

  /// This method helps to reach changeTagData method from TagDetailViewModel
  static void changeTagData(ref, Tag newData) => ref
      .read(TagDetailProviders.tagDetailViewModelProvider.notifier)
      .changeTagData(
        newData,
      );

  // /// This function changes the isEdited status

  static bool isEdited(ref) => ref.watch(isEditedProvider);
}
