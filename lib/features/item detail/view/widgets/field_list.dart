part of '../item_detail_view.dart';

class _FieldList extends StatelessWidget {
  const _FieldList({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: item.fields!.length,
      itemBuilder: (context, index) {
        final FieldModel field = item.fields![index];
        return Padding(
          padding: EdgeInsets.only(bottom: AppPaddings.mPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Field Name
              Text(
                field.fieldNameController.text.toUpperCase(),
                style: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(AppPaddings.xxsPadding),
              _FieldListUtility._fieldGenerator(field),
            ],
          ),
        );
      },
    );
  }
}

final class _FieldListUtility {
  static Widget _fieldGenerator(FieldModel field) {
    switch (field.fieldType) {
      case ItemFieldNames.Color:
        return _ItemColorField(color: field.fieldController.text);
      case ItemFieldNames.Date:
        return _ItemDateField(date: field.fieldController.text);
      case ItemFieldNames.Text:
        return _ItemTextField(text: field.fieldController.text);
      default:
        return const SizedBox();
    }
  }
}
