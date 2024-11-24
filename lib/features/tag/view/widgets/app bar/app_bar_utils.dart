part of tag_detail_view;

mixin _TagDetailAppBarMixin on State<_TagDetailAppBar> {
  final String noNameText = tr(LocaleKeys.tag_noNameText);
  final String heroTag = "tag";

  bool editStatus = false;

  void changeEditStatus() {
    setState(() {
      editStatus = !editStatus;
    });
  }
}
