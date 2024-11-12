part of tag_detail_view;

mixin _AppBarUtils on State<_TagDetailAppBar> {
  final String noNameText = 'No name';
  final String heroTag = "tag";

  bool editStatus = false;

  void changeEditStatus() {
    setState(() {
      editStatus = !editStatus;
    });
  }
}
