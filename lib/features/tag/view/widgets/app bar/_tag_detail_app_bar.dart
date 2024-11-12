part of tag_detail_view;

/// This is the default app bar for the TagDetailView
class _TagDetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Tag tag;
  const _TagDetailAppBar({required this.tag});

  @override
  State<_TagDetailAppBar> createState() => _TagDetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TagDetailAppBarState extends State<_TagDetailAppBar>
    with _TagDetailAppBarMixin {
  @override
  Widget build(BuildContext context) {
    /// if the edit status is true, show the edit state app bar
    return editStatus
        ? _EditStateAppBar(changeEditStatus)
        : AppBar(
            title: Hero(
              tag: heroTag,
              child: Text(
                widget.tag.name ?? noNameText,
                style: context.textTheme.titleLarge,
              ),
            ),
            actions: [
              IconButton(
                onPressed: changeEditStatus,
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
}
