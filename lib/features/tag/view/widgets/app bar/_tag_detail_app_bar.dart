part of tag_detail_view;

class _TagDetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Tag tag;
  const _TagDetailAppBar({required this.tag});

  @override
  State<_TagDetailAppBar> createState() => _TagDetailAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TagDetailAppBarState extends State<_TagDetailAppBar> with _AppBarUtils {
  @override
  Widget build(BuildContext context) {
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
                onPressed:
                    changeEditStatus, // TagDetailProvider.updateEditStatus(ref),
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
