part of tag_detail_view;

mixin _EditStateAppBarUtils on ConsumerState<_EditStateAppBar> {
  final TextEditingController controller = TextEditingController();

  final String nameCantBeEmpty = "Name can't be empty";
  final String ifYouWantToCancelTheEditPressTheCloseButton =
      'If you want to cancel the edit, press the close button';
  bool validate() {
    return controller.text.isNotEmpty;
  }

  void onTapCheck(ref, VoidCallback changeEditStatus) {
    validate()
        ? {
            TagDetailProvider.changeTagData(ref, Tag(name: controller.text)),
            changeEditStatus(),
          }
        : Toast.errToast(
            title: nameCantBeEmpty,
            desc: ifYouWantToCancelTheEditPressTheCloseButton,
          );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
