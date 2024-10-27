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

  ///This method is used to show the bottom sheet
  ///
  ///[context] used for [showModalBottomSheet]
  ///
  ///[widget] is the widget that will be shown in the bottom sheet
  static Future show(BuildContext context, {required Widget widget}) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => widget,
    );
  }

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      dragHandleColor: _utils.handleColor,
      backgroundColor: widget.backgroundColor ?? _utils.backgroundColor,
      onClosing: () {
        context.pop();
      },
      shadowColor: _utils.shadowColor,
      elevation: 5,
      showDragHandle: true,
      enableDrag: true,
      animationController: _utils._animationController,
      // constraints: _utils.constraints(context),
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            height:
                _utils._isKeyboardVisible ? _utils._keyboardSize * 1.5 : null,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
            ),
          ),
        );
      },
    );
  }

  late _CustomBottomSheetUtils _utils;
  @override
  void initState() {
    _utils = _CustomBottomSheetUtils(
        context: context, heightFactor: widget.heightFactor);
    _utils.initState(
        vsync: this,
        setState: () => setState(
              () {},
            ));
    super.initState();
  }

  @override
  void dispose() {
    _utils.dispose();
    super.dispose();
  }
}

final class _CustomBottomSheetUtils {
  final BuildContext context;
  final double heightFactor;
  late AnimationController _animationController;

  _CustomBottomSheetUtils({
    required this.context,
    required this.heightFactor,
  });

  void initState({
    required TickerProvider vsync,
    required Function setState,
  }) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Durations.medium2,
    );
    _animationController.forward(from: 0.1);
    _animationController.addListener(() => setState());
  }

  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
  }

  final Color? shadowColor = AppColors.neutralBackgroundLight[100];
  final Color? handleColor = AppColors.neutralBackgroundLight[100];
  final Color? backgroundColor = AppColors.neutralBackgroundLight[50];

  ///I get keyboard size , this way I can change the maxHeight of the BottomSheet
  double get _keyboardSize => context.mediaQuery.viewInsets.bottom;
  bool get _isKeyboardVisible => _keyboardSize > 0;
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
