import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/models/tag.dart';
import '../services/fetch_items_from_database_service.dart';
import '../view%20model/tag_detail_view_model.dart';

final class TagDetailProviders {
  /// This class is used to provide the necessary providers for the TagDetailView
  ///
  /// ### The providers are:
  /// #### itemListProvider
  ///       - This provider fetches the items from the database
  ///#### tagDetailViewModelProvider
  ///       - This provider is the view model for the TagDetailView
  ///#### isEditedProvider
  ///      - This provider is used to check if the tag is edited
  TagDetailProviders._(this.initialTag) {
    _tag = initialTag;
  }
  factory TagDetailProviders(Tag tag) {
    return TagDetailProviders._(tag);
  }

  /// This is the initial tag that is given to the provider from the scan result
  final Tag initialTag;

  /// This is the tag that is used in the provider class
  static late Tag _tag;

  /// It is a [FutureProvider] that fetches the items from the database
  /// and returns a [DataState] object
  ///
  /// If the fetch is successful it returns a [DataSuccess] object
  ///
  /// If the fetch is unsuccessful it returns a [DataFailed] object
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

  /// This is a [StateNotifierProvider] that provides the [TagDetailViewModel]
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

  //--------- Methods
  /// This method helps to reach changeTagData method from TagDetailViewModel
  static void changeTagData(ref, Tag newData) => ref
      .read(TagDetailProviders.tagDetailViewModelProvider.notifier)
      .changeTagData(
        newData,
      );

  static bool isEdited(ref) => ref.watch(isEditedProvider);
}
