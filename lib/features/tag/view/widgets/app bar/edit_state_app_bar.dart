part of tag_detail_view;

class _EditStateAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final VoidCallback changeEditStatus;
  const _EditStateAppBar(this.changeEditStatus);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditStateAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _EditStateAppBarState extends ConsumerState<_EditStateAppBar>
    with _EditStateAppBarUtils {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SizedBox(
        width: double.infinity,
        height: kToolbarHeight,
        child: CustomTextField(
          controller: controller,
          suffix: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// [IconButton] to save the edited tag name
              IconButton(
                onPressed: () => onTapCheck(ref, widget.changeEditStatus),
                icon: Icon(
                  Icons.check,
                  color: AppColors.accentSuccess[80],
                ),
              ),

              /// [IconButton] to cancel the edit
              IconButton(
                onPressed: widget.changeEditStatus,
                icon: Icon(
                  Icons.close,
                  color: AppColors.accentError[80],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
