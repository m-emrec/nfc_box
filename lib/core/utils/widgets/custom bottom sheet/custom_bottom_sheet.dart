import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/theme/theme_extensions/custom_bottom_sheet_them.dart';

import '../../../constants/colors.dart';
import '../../../extensions/context_extension.dart';
part 'custom_bottom_sheet_utils.dart';

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
    with SingleTickerProviderStateMixin, _CustomBottomSheetUtils {
  @override
  void initState() {
    initializeAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      dragHandleColor:
          context.theme.extension<CustomBottomSheetTheme>()?.handleColor,
      backgroundColor: widget.backgroundColor ??
          context.theme.extension<CustomBottomSheetTheme>()?.backgroundColor,
      onClosing: () => context.pop(),
      shadowColor:
          context.theme.extension<CustomBottomSheetTheme>()?.shadowColor,
      elevation: 5,
      showDragHandle: true,
      enableDrag: true,
      animationController: animationController,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            height: isKeyboardVisible ? keyboardSize * 1.5 : null,
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
}
