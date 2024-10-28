import 'package:flutter/material.dart';
import 'package:nfc_box/logger.dart';
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
}
