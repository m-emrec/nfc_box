import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/utils/models/tag.dart';
import '../view%20model/tag_detail_view_model.dart';

final class TagDetailProvider {
  factory TagDetailProvider(Tag tag) {
    return TagDetailProvider._(tag);
  }
  final Tag initialTag;
  TagDetailProvider._(this.initialTag) {
    _tag = initialTag;
  }
  static late Tag _tag;

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

  /// This method helps to reach changeTagData method from TagDetailViewModel
  static void changeTagData(ref, Tag newData) => ref
      .read(TagDetailProvider.tagDetailViewModelProvider.notifier)
      .changeTagData(
        newData,
      );

  // /// This function changes the isEdited status

  static bool isEdited(ref) => ref.watch(isEditedProvider);
}
