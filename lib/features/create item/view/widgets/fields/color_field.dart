import 'package:flutter/material.dart';
import 'package:nfc_box/logger.dart';

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
  final _ColorFieldUtils _colorFieldUtils = _ColorFieldUtils();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _colorFieldUtils._colorList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: _colorFieldUtils.padding,
            child: GestureDetector(
              onTap: () => _colorFieldUtils.selectColor(
                index,
                func: () => setState(
                  () {},
                ),
                controller: widget.controller,
              ),
              child: _colorItem(index),
            ),
          );
        },
      ),
    );
  }

  Badge _colorItem(int index) {
    return Badge(
      isLabelVisible: _colorFieldUtils.isLabelVisible(index),
      child: CircleAvatar(
        backgroundColor: Color(
          _colorFieldUtils._colorList[index],
        ),
      ),
    );
  }
}

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
  final List<int> _colorList = [
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
