import 'package:flutter/material.dart';
import 'package:nfc_box/core/constants/enums/color_values.dart';

import '../../../../../../core/constants/app_paddings.dart';

part 'utils.dart';

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
