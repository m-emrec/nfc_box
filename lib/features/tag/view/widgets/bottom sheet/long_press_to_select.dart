part of 'add_item_bottom_sheet.dart';

class _LongPressToSelect extends StatefulWidget {
  const _LongPressToSelect();

  @override
  State<_LongPressToSelect> createState() => _LongPressToSelectState();
}

class _LongPressToSelectState extends State<_LongPressToSelect>
    with SingleTickerProviderStateMixin, _LongPressToSelectUtils {
  @override
  void initState() {
    initializeAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: controller.duration!,
      opacity: controller.value,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppBorderRadius.smallRadiusValue),
          child: ColoredBox(
            color: AppColors.secondaryLightTeal[90]!,
            child: Padding(
              padding: EdgeInsets.all(AppPaddings.xsPadding),
              child: Text(
                longPressToSelectText,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.neutralGray100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
