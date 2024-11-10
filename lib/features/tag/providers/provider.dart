import 'package:flutter_riverpod/flutter_riverpod.dart';

final class TagDetailProvider {
  TagDetailProvider._();

  /// Stores the edit status of the tag name
  ///  - true: the tag name is being edited
  static final editStatusProvider = StateProvider.autoDispose<bool>((ref) {
    return false;
  });

  /// This provider is used to store the tag name that is being edited
  static final tagNameProvider = StateProvider.autoDispose<String>((ref) {
    return "";
  });

  /// Methods

  /// This function updates the tag name with the value from the controller
  static void editTagName(ref, controller) =>
      ref.read(tagNameProvider.notifier).update(
        (String state) {
          state = controller.text;
          updateEditStatus(ref);
          return state;
        },
      );

  /// This function returns the edit status
  static bool editStatus(ref) => ref.watch(editStatusProvider);

  /// This function changes the edit status
  static void updateEditStatus(ref) {
    ref.read(editStatusProvider.notifier).update((state) => state = !state);
  }
}
