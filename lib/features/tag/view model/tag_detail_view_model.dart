import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/models/tag.dart';

class TagDetailViewModel extends StateNotifier<Tag> {
  final Tag tag;
  TagDetailViewModel(
    this.tag,
  ) : super(tag);

  /// Remove an item from the tag
  void removeItem(Item item) {
    state = state.copyWith(
      items: state.items!.where((element) => element.id != item.id).toList(),
    );
  }

  /// Add items to the tag
  void addItemToTag(List<Item> items) {
    if (state.items == null) {
      state = state.copyWith(items: []);
    }
    state = state.copyWith(
      items: [
        ...state.items ?? [],
        ...items.where(
          (item) => state.items!.every(
            (element) => element.id != item.id,
          ),
        )
      ],
    );
  }

  /// Change the tag data
  void changeTagData(Tag newTag) {
    state = state.copyWith(
      name: newTag.name,
      items: newTag.items,
    );
  }
}
