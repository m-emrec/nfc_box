import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/logger.dart';

import '../../../config/theme/app_theme.dart';

class CustomTextField extends TextFormField {
  CustomTextField({
    super.key,
    super.controller,
  }) : super(
          // autovalidateMode: AutovalidateMode.,
          validator: (value) => value!.length < 3 ? "asdasd" : null,
        );

  @override
  FormFieldBuilder<String> get builder => (state) {
        bool isEmpty = controller!.text.isEmpty;
        bool isValid = !state.hasError;
        return TextFormField(
          textAlignVertical: TextAlignVertical.top,
          controller: controller,
          decoration: InputDecoration(
              alignLabelWithHint: false,
              labelText: "Label",
              prefixIconConstraints: BoxConstraints(
                minHeight: 48,
                minWidth: 48,
              ),
              prefixIcon: Align(
                heightFactor: 0,
                widthFactor: 0,
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.email,
                  size: 24,
                  color: isEmpty
                      ? AppColors.gray500
                      : isValid
                          ? AppColors.tealColor
                          : AppColors.errorTextColor,
                ),
              )),
        );
      };
}
