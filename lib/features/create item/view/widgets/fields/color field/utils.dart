part of 'color_field.dart';

final class _ColorFieldUtils {
  void selectColor(
    int index, {
    required Function func,
    required TextEditingController controller,
  }) {
    selectedIndex = index;
    controller.text = _colorList[index].toString();
    func();
  }

  bool isLabelVisible(index) => selectedIndex == index;

  EdgeInsets padding = EdgeInsets.only(
    right: AppPaddings.sPadding,
    top: AppPaddings.xsPadding,
  );
  int? selectedIndex;

  final List<int> _colorList = ColorValues.values.map((e) => e.value).toList();
}
