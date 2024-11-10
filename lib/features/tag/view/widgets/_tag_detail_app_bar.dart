part of tag_detail_view;

class _TagDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Tag tag;
  const _TagDetailAppBar({required this.tag});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Hero(
        tag: "tag",
        child: Text(
          tag.name ?? 'No name',
          style: context.textTheme.titleLarge,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
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
