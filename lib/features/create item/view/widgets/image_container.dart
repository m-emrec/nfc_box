import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/border_radiuses.dart';
import '../../../../core/constants/colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AspectRatio(
        aspectRatio: 382 / 248,
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColors.neutralGray100[50],
              borderRadius: AppBorderRadius.mediumBorderRadius,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x198C7373),
                  blurRadius: 23,
                  offset: Offset(0, 11),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x168C7373),
                  blurRadius: 42,
                  offset: Offset(0, 42),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x0C8C7373),
                  blurRadius: 57,
                  offset: Offset(0, 95),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x028C7373),
                  blurRadius: 67,
                  offset: Offset(0, 168),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x008C7373),
                  blurRadius: 74,
                  offset: Offset(0, 263),
                  spreadRadius: 0,
                )
              ]),
          child: InkWell(
            splashColor: Colors.red,
            onTap: () {},
            child: Image.asset(
              AppAssets.chooseImagePath,
            ),
          ),
        ),
      ),
    );
  }
}
