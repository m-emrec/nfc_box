part of tag_detail_view;

class _NoItemList extends StatelessWidget {
  const _NoItemList();
  static const _noItemsFound = 'No items found';

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
