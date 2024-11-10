part of tag_detail_view;

final class _AppBarUtils {
  static final TextEditingController controller = TextEditingController();
  static const String nameCantBeEmpty = "Name can't be empty";
  static const String ifYouWantToCancelTheEditPressTheCloseButton =
      'If you want to cancel the edit, press the close button';

  static const noNameText = 'No name';
  static const heroTag = "tag";

  static bool validate() {
    return controller.text.isNotEmpty;
  }

  static void onTapCheck(ref) {
    _AppBarUtils.validate()
        ? TagDetailProvider.editTagName(ref, _AppBarUtils.controller)
        : Toast.errToast(
            title: _AppBarUtils.nameCantBeEmpty,
            desc: _AppBarUtils.ifYouWantToCancelTheEditPressTheCloseButton,
          );
  }
}
