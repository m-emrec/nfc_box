part of '../item_list_page.dart';

class _LoadingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Item dummy = Item(
      itemName: 'Loading...',
      id: 'Loading...',
      imageUrl: '',
      createdDate: DateTime.now(),
    );

    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Skeletonizer(
          containersColor: AppColors.neutralBackgroundLight[50],
          enabled: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppPaddings.sPadding / 2,
              horizontal: AppPaddings.xsPadding,
            ),
            child: ItemCard(
              item: dummy,
              removeAction: () {},
            ),
          ),
        );
      },
    );
  }
}
