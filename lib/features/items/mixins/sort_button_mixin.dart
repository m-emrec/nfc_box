part of '../view/widgets/app bar/item_list_app_bar.dart';

mixin _SortButtonMixin on ConsumerState<_SortButton> {
  SortType initialValue = SortType.date;
  void popMenuButtonOnSelected(value) {
    switch (value) {
      case SortType.date:
        ItemListProvider.sortByCreatedDate(ref);
        setState(() {
          initialValue = SortType.date;
        });
        break;
      case SortType.name:
        ItemListProvider.sortByName(ref);
        setState(() {
          initialValue = SortType.name;
        });
        break;
      case SortType.fieldCount:
        ItemListProvider.sortByFieldCount(ref);
        setState(() {
          initialValue = SortType.fieldCount;
        });
        break;
      default:
    }
  }

  @override
  void initState() {
    super.initState();
  }
}
