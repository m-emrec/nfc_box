import 'package:flutter/material.dart';
import 'package:nfc_box/core/utils/widgets/custom_bottom_sheet.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/border_radiuses.dart';
import '../../../../core/constants/colors.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius.mediumBorderRadius,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.neutralGray100[50],
            boxShadow: _ImageContainerUtils._shadows,
          ),
          child: InkWell(
            splashColor: AppColors.neutralGray100[70],
            onTap: () => _ImageContainerUtils.onImageContainerPressed(context),
            child: AspectRatio(
              aspectRatio: 24 / 16,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.mediumBorderRadius,
                ),
                child: Image.asset(
                  AppAssets.chooseImagePath,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageContainerUtils {
  static void onImageContainerPressed(BuildContext context) {
    CustomBottomSheet.show(context,
        widget: CustomBottomSheet(
          heightFactor: 0.2,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Choose from gallery'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a picture'),
                onTap: () {},
              ),
              // Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     ListTile(
              //       leading: const Icon(Icons.photo),
              //       title: const Text('Choose from gallery'),
              //       onTap: () {},
              //     ),
              //     ListTile(
              //       leading: const Icon(Icons.camera_alt),
              //       title: const Text('Take a picture'),
              //       onTap: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
        ));
  }

  static const List<BoxShadow> _shadows = [
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
  ];
}
