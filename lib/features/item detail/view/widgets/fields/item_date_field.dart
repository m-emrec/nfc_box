part of '../../item_detail_view.dart';

class _ItemDateField extends StatelessWidget {
  final String date;
  const _ItemDateField({required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today, color: AppColors.neutralGray900[100]),
        Gap(AppPaddings.xxsPadding),
        Text(
          DateFormat.yMMMEd().format(DateTime.parse(date)),
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}
