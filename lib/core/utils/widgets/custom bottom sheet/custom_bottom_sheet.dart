import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/colors.dart';
import '../../../extensions/context_extension.dart';
part 'utils.dart';

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
