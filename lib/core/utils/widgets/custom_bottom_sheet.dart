import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/logger.dart';

import '../../constants/colors.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
    this.title,
    this.content,
    this.backgroundColor,
    this.heightFactor = .5,
  });
  final String? title;
  final Widget? content;
  final Color? backgroundColor;
  final double heightFactor;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.medium2,
    );
    _animationController.forward(from: 0.1);
    _animationController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
    super.dispose();
  }

  double get _keyboardSize => context.mediaQuery.viewInsets.bottom;

  double get _maxHeight =>
      context.screenSize.height *
          widget.heightFactor *
          _animationController.value +
      _keyboardSize;

  double get _minHeight =>
      context.screenSize.height *
          widget.heightFactor *
          _animationController.value +
      _keyboardSize;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      dragHandleColor: AppColors.neutralBackgroundLight[100],
      backgroundColor:
          widget.backgroundColor ?? AppColors.neutralBackgroundLight[50],
      onClosing: () {
        context.pop();
      },
      shadowColor: AppColors.neutralBackgroundLight[100],
      elevation: 5,
      showDragHandle: true,
      enableDrag: true,
      animationController: _animationController,
      constraints: BoxConstraints(
        minHeight: _minHeight,
        maxHeight: _maxHeight,
        minWidth: context.screenSize.width,
        maxWidth: context.screenSize.width,
      ),
      builder: (context) {
        return Column(
          children: [
            widget.title == null
                ? const SizedBox()
                : Text(
                    widget.title ?? "",
                    style: context.textTheme.titleMedium,
                  ),
            Flexible(
              child: widget.content ?? const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
