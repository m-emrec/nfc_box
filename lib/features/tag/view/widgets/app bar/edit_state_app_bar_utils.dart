part of tag_detail_view;

mixin _EditStateAppBarUtils on ConsumerState<_EditStateAppBar> {
  final TextEditingController controller = TextEditingController();

  final String nameCantBeEmpty = tr(LocaleKeys.tag_nameCantBeEmpty);
  final String ifYouWantToCancelTheEditPressTheCloseButton =
      tr(LocaleKeys.tag_ifYouWantToCancelTheEditPressTheCloseButton);

  bool get _validate => controller.text.isNotEmpty;

  void onTapCheck(ref, VoidCallback changeEditStatus) {
    _validate
        ? _saveTagName(ref, changeEditStatus)
        : Toast.errToast(
            title: nameCantBeEmpty,
            desc: ifYouWantToCancelTheEditPressTheCloseButton,
          );
  }

  void _saveTagName(ref, VoidCallback changeEditStatus) {
    TagDetailProviders.changeTagData(ref, Tag(name: controller.text));
    changeEditStatus();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
