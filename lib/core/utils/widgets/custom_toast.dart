import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../constants/colors.dart';

class Toast {
  /// Error Toast
  static ToastificationItem errToast({
    String? title,
    String? desc,
    bool dismissible = true,
    AlignmentGeometry alignment = Alignment.bottomCenter,
    EdgeInsetsGeometry? margin,
  }) =>
      toastification.show(
        title: Text(title ?? ""),
        description: Text(desc ?? ""),
        alignment: alignment,
        backgroundColor: AppColors.accentError[20],
        borderSide: BorderSide.none,
        dragToClose: dismissible,
        autoCloseDuration: dismissible ? const Duration(seconds: 3) : null,
        showProgressBar: false,
        showIcon: false,
        foregroundColor: AppColors.accentError[100],
        closeButtonShowType: CloseButtonShowType.none,
        margin: margin,
      );

  static ToastificationItem succToast({
    String? title,
    String? desc,
    bool dismissible = true,
    AlignmentGeometry alignment = Alignment.bottomCenter,
    EdgeInsetsGeometry? margin,
  }) =>
      toastification.show(
        title: Text(title ?? ""),
        description: Text(desc ?? ""),
        alignment: alignment,
        backgroundColor: AppColors.accentSuccess[20],
        borderSide: BorderSide.none,
        dragToClose: dismissible,
        autoCloseDuration: dismissible ? const Duration(seconds: 3) : null,
        showProgressBar: false,
        showIcon: false,
        foregroundColor: AppColors.accentSuccess[100],
        closeButtonShowType: CloseButtonShowType.none,
        margin: margin,
      );

  // static ToastificationItem wellDone() => toastification.show(
  //       animationDuration: Duration.zero,
  //       title: LottieBuilder.asset(
  //         AppAssets.wellDoneAnimation,
  //       ),
  //       autoCloseDuration: const Duration(seconds: 2),
  //       alignment: Alignment.topCenter,
  //       animationBuilder: (context, animation, alignment, child) {
  //         return BackdropFilter(
  //           filter: ImageFilter.blur(
  //             sigmaX: 3,
  //             sigmaY: 3,
  //           ),
  //           child: SizedBox(
  //             height: context.dynamicHeight(1),
  //             width: context.dynamicWidth(1),
  //             child: ColoredBox(
  //               color: AppColors.homeScaffoldColor.withOpacity(0.1),
  //               child: child,
  //             ),
  //           ),
  //         );
  //       },
  //       // description:

  //       margin: EdgeInsets.zero,
  //       padding: EdgeInsets.zero,
  //       closeButtonShowType: CloseButtonShowType.none,
  //       showIcon: false,
  //       showProgressBar: false,
  //       backgroundColor: Colors.transparent,
  //       borderSide: BorderSide.none,
  //       // applyBlurEffect: true,
  //     );
}
