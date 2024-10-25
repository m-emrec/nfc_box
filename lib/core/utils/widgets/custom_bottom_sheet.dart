import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors.dart';
import '../../extensions/context_extension.dart';

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
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      dragHandleColor: _properties.handleColor,
      backgroundColor: widget.backgroundColor ?? _properties.backgroundColor,
      onClosing: () {
        context.pop();
      },
      shadowColor: _properties.shadowColor,
      elevation: 5,
      showDragHandle: true,
      enableDrag: true,
      animationController: _properties._animationController,
      constraints: _properties.constraints(context),
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

  late _CustomBottomSheetProperties _properties;
  @override
  void initState() {
    _properties = _CustomBottomSheetProperties(
        context: context, heightFactor: widget.heightFactor);
    _properties._animationController = AnimationController(
      vsync: this,
      duration: Durations.medium2,
    );
    _properties._animationController.forward(from: 0.1);
    _properties._animationController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _properties.dispose();
    super.dispose();
  }
}

final class _CustomBottomSheetProperties {
  final BuildContext context;
  final double heightFactor;
  late AnimationController _animationController;

  _CustomBottomSheetProperties({
    required this.context,
    required this.heightFactor,
  });

  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
  }

  final Color? shadowColor = AppColors.neutralBackgroundLight[100];
  final Color? handleColor = AppColors.neutralBackgroundLight[100];
  final Color? backgroundColor = AppColors.neutralBackgroundLight[50];

  ///I get keyboard size , this way I can change the maxHeight of the BottomSheet
  double get _keyboardSize => context.mediaQuery.viewInsets.bottom;

  double get _maxHeight =>
      context.screenSize.height * heightFactor * _animationController.value +
      _keyboardSize;

  double get _minHeight =>
      context.screenSize.height * heightFactor * _animationController.value +
      _keyboardSize;

  BoxConstraints constraints(BuildContext context) {
    return BoxConstraints(
      minHeight: _minHeight,
      maxHeight: _maxHeight,
      minWidth: context.screenSize.width,
      maxWidth: context.screenSize.width,
    );
  }
}
