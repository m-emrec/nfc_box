part of 'color_field.dart';

final class _ColorFieldUtils {
  int? selectedIndex;
  final List<int> _colorList = ColorValues.values.map((e) => e.value).toList();
  void selectColor(
    int index, {
    required Function func,
    required TextEditingController controller,
  }) {
    selectedIndex = index;
    controller.text = _colorList[index].toString();
    func();
  }

  /// if selected index is equal to index then return true
  bool isLabelVisible(index) => selectedIndex == index;

  EdgeInsets padding = EdgeInsets.only(
    right: AppPaddings.sPadding,
    top: AppPaddings.xsPadding,
  );
  Badge _colorItem(int index) {
    return Badge(
      isLabelVisible: isLabelVisible(index),
      child: CircleAvatar(
        backgroundColor: Color(
          _colorList[index],
        ),
      ),
    );
  }
}
