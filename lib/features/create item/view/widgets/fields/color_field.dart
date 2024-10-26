import 'package:flutter/material.dart';

import '../../../../../core/constants/app_paddings.dart';

class ColorField extends StatefulWidget {
  final TextEditingController controller;
  const ColorField({
    super.key,
    required this.controller,
  });

  @override
  State<ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends State<ColorField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _ColorFieldUtils._colorList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppPaddings.sPadding),
            child: GestureDetector(
              onTap: () => _ColorFieldUtils.selectColor(
                index,
                func: () => setState(
                  () {},
                ),
                controller: widget.controller,
              ),
              child: Badge(
                isLabelVisible: _ColorFieldUtils.isLabelVisible(index),
                child: CircleAvatar(
                  backgroundColor: Color(
                    _ColorFieldUtils._colorList[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

final class _ColorFieldUtils {
  static void selectColor(
    int index, {
    required Function func,
    required TextEditingController controller,
  }) {
    selectedIndex = index;
    controller.text = _colorList[index].toString();
    func();
  }

  static bool isLabelVisible(index) => selectedIndex == index;
  static int? selectedIndex;
  static final List<int> _colorList = [
    Colors.red.value,
    Colors.green.value,
    Colors.blue.value,
    Colors.yellow.value,
    Colors.orange.value,
    Colors.purple.value,
    Colors.pink.value,
    Colors.brown.value,
    Colors.cyan.value,
    Colors.teal.value,
    Colors.amber.value,
    Colors.indigo.value,
    Colors.lime.value,
    Colors.grey.value,
    Colors.black.value,
    Colors.white.value,
  ];
}
