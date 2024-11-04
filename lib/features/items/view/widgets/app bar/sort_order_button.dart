part of 'item_list_app_bar.dart';

class _SortOrderButton extends StatelessWidget {
  const _SortOrderButton({
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Badge(
          backgroundColor: Colors.transparent,
          alignment: Alignment.bottomLeft,
          label: Text(
            ItemListProvider.isDescending(ref) ? 'ASC' : 'DESC',
            style: context.textTheme.labelSmall,
          ),
          child: IconButton(
            onPressed: () {
              ItemListProvider.changeSortOrder(ref);
            },
            icon: Icon(
              ItemListProvider.isDescending(ref)
                  ? Icons.arrow_upward_sharp
                  : Icons.arrow_downward_sharp,
            ),
          ),
        ),
      ],
    );
  }
}
