part of tag_detail_view;

class _TagDetailAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Tag tag;
  const _TagDetailAppBar({required this.tag});

  static const noNameText = 'No name';
  static const heroTag = "tag";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool editStatus = TagDetailProvider.editStatus(ref);
    final String editedTagName = ref.watch(TagDetailProvider.tagNameProvider);

    return editStatus
        ? _EditStateAppBar()
        : AppBar(
            title: Hero(
              tag: heroTag,
              child: Text(
                editedTagName.isEmpty ? tag.name ?? noNameText : editedTagName,
                style: context.textTheme.titleLarge,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => TagDetailProvider.updateEditStatus(ref),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: AppColors.accentError[80],
              ),
            ],
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
