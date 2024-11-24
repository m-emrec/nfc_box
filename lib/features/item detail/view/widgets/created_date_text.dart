part of '../item_detail_view.dart';

class _CreatedDateText extends StatelessWidget {
  _CreatedDateText({
    required this.item,
  }) : createdDate = tr(LocaleKeys.itemDetail_createdDate);

  final Item item;

  final String createdDate;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$createdDate ",
          style: context.textTheme.bodyMedium,
        ),
        Text(
          DateFormat.yMMMEd(context.locale.toString()).format(
            item.createdDate ?? DateTime.now(),
          ),
          style: context.textTheme.bodyMedium?.copyWith(
            color: AppColors.neutralGray500[70],
          ),
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
