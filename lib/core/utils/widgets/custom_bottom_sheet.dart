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
    _animationController =
        AnimationController(vsync: this, duration: Durations.medium2);
    _animationController.forward();
    _animationController.addListener(() => setState(() {
          // logger.i(context.mediaQuery.viewInsets);
        }));
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
        maxHeight: _maxHeight,
        minWidth: context.screenSize.width,
      ),
      builder: (context) {
        return Column(
          children: [
            Text(
              widget.title ?? "",
              style: context.textTheme.titleMedium,
            ),
            Expanded(
              child: widget.content ?? const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
