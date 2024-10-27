import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/border_radiuses.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/widgets/custom_bottom_sheet.dart';

part 'choose_image_menu_sheet.dart';
part 'image_container_utils.dart';

class ChooseImageContainer extends StatefulWidget {
  final TextEditingController controller;
  const ChooseImageContainer({
    super.key,
    required this.controller,
  });

  @override
  State<ChooseImageContainer> createState() => _ChooseImageContainerState();
}

class _ChooseImageContainerState extends State<ChooseImageContainer> {
  late final _ImageContainerUtils _imageContainerUtils;
  @override
  void initState() {
    _imageContainerUtils = _ImageContainerUtils(
      setState: () => setState(() {}),
      controller: widget.controller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _imageContainerUtils.onImageContainerPressed(context),
      child: AspectRatio(
        aspectRatio: 24 / 16,
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.mediumBorderRadius,
            color: AppColors.neutralGray100[50],
            boxShadow: _imageContainerUtils._shadows,
          ),
          child: _imageContainerUtils.image != null
              ? Image.file(_imageContainerUtils.image!, fit: BoxFit.cover)
              : Image.asset(
                  AppAssets.chooseImagePath,
                ),
        ),
      ),
    );
  }
}
