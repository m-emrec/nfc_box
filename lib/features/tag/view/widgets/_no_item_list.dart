part of tag_detail_view;

/// if there are no items, show this widget
class _NoItemList extends StatelessWidget {
  const _NoItemList();
  static final _noItemsFound = tr(LocaleKeys.tag_noItemsFound);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _noItemsFound,
        style: context.textTheme.bodyLarge?.copyWith(
          color: AppColors.neutralGray900[40],
        ),
      ),
    );
  }
}
