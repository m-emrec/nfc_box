part of tag_detail_view;

class _EditStateAppBar extends ConsumerWidget implements PreferredSizeWidget {
  _EditStateAppBar();
  final TextEditingController controller = TextEditingController();

  bool validate() {
    return controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onPressed: () => validate()
                    ? TagDetailProvider.editTagName(ref, controller)
                    : Toast.errToast(
                        title: "Name can't be empty",
                        desc:
                            "If you want to cancel the edit, press the close button"),
                icon: Icon(
                  Icons.check,
                  color: AppColors.accentSuccess[80],
                ),
              ),

              /// [IconButton] to cancel the edit
              IconButton(
                onPressed: () => TagDetailProvider.updateEditStatus(ref),
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
