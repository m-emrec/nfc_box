import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/border_radiuses.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/utils/widgets/custom bottom sheet/custom_bottom_sheet.dart';

part 'choose_image_menu_sheet.dart';
part 'image_container_utils.dart';

class ChooseImageContainer extends StatefulWidget {
  final TextEditingController controller;
  final bool isEdit;
  const ChooseImageContainer({
    super.key,
    required this.controller,
    required this.isEdit,
  });

  @override
  State<ChooseImageContainer> createState() => _ChooseImageContainerState();
}

class _ChooseImageContainerState extends State<ChooseImageContainer>
    with _ImageContainerUtils {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onImageContainerPressed(context),
      child: AspectRatio(
        aspectRatio: 24 / 16,
        child: Container(
          clipBehavior: Clip.antiAlias,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.mediumBorderRadius,
            color: AppColors.neutralGray100[50],
            boxShadow: _shadows,
          ),
          child: buildImageWidget(),
        ),
      ),
    );
  }
}
