part of tag_detail_view;

class _EditStateAppBar extends ConsumerWidget implements PreferredSizeWidget {
  _EditStateAppBar();
  final TextEditingController controller = TextEditingController();
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
              IconButton(
                onPressed: () => TagDetailProvider.editTagName(ref, controller),
                icon: const Icon(Icons.check),
              ),
              IconButton(
                onPressed: () => TagDetailProvider.updateEditStatus(ref),
                icon: const Icon(Icons.cancel),
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
