import 'package:flutter/material.dart';

import '../../../../../core/constants/app_paddings.dart';

class ColorField extends StatelessWidget {
  ColorField({super.key});
  final List<int> _allColors = [
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _allColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: AppPaddings.sPadding),
            child: CircleAvatar(
              backgroundColor: Color(_allColors[index]),
            ),
          );
        },
      ),
    );
  }
}
