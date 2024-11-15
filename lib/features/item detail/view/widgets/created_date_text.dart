part of '../item_detail_view.dart';

class _CreatedDateText extends StatelessWidget {
  const _CreatedDateText({
    required this.item,
  });

  final Item item;

  final String createdDate = 'Created Date';
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
          DateFormat.yMMMEd().format(
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
