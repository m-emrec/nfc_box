import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/models/tag.dart';

class TagDetailViewModel extends StateNotifier<Tag> {
  final Tag tag;
  TagDetailViewModel(
    this.tag,
  ) : super(tag);

  void changeTagData(Tag newTag) {
    state = state.copyWith(
      name: newTag.name,
      items: newTag.items,
    );
  }
}
