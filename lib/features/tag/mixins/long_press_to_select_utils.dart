part of '../view/widgets/bottom sheet/add_item_bottom_sheet.dart';

mixin _LongPressToSelectUtils on State<_LongPressToSelect> {
  late AnimationController controller;
  final String longPressToSelectText = tr(LocaleKeys.tag_longPressToSelect);
  void initializeAnimationController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: Durations.extralong4,
      lowerBound: 0,
      upperBound: 0.8,
    );
    controller.reverse(from: controller.upperBound);
    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }
}
