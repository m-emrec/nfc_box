part of tag_detail_view;

class _EditStateAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _EditStateAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: SizedBox(
        width: double.infinity,
        height: kToolbarHeight,
        child: CustomTextField(
          controller: _AppBarUtils.controller,
          suffix: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// [IconButton] to save the edited tag name
              IconButton(
                onPressed: () => _AppBarUtils.onTapCheck(ref),
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
