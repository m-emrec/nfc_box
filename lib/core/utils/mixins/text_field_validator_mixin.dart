import 'package:flutter/material.dart';

import '../../constants/colors.dart';

/// This mixin helps you to change the color of the TextField's border and prefixIcon.
///
/// it has 3 states:
///
/// `Success`state returns [AppColors.accentSuccess]
///
/// `Focus`state returns [AppColors.accentOrange]
///
/// `Error`state returns [AppColors.accentError]
///
/// **To use this mixin, first you have to call [initTextFieldState] inside [initState]**
///
/// To `dispose`it you can call [disposeTextFieldState] inside [dispose]
mixin TextFieldStateMixin {
  /// To use this mixin you have to call this function in the ``initState()``
  void initTextFieldState({
    required Function setState,
    required FocusNode focusNode,
    String? Function(String?)? validator,
    required TextEditingController controller,
  }) {
    _hasFocus = focusNode.hasFocus;
    _setState = setState;
    _focusNode = focusNode;
    _fieldValidator = validator;
    _controller = controller;
    _focusNode.addListener(_focusListener);
    _controller.addListener(setColorState);
  }

  void disposeTextFieldState() {
    _controller.removeListener(() {});
    _focusNode.removeListener(() {});
    _controller.dispose();
    _focusNode.dispose();
  }

  late bool _hasFocus;

  late Function _setState;
  late FocusNode _focusNode;
  late String? Function(String?)? _fieldValidator;
  late TextEditingController _controller;

  void _focusListener() {
    _setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  /// This function changes the color depending on the TextField State
  /// and returns the color.
  Color? setColorState() {
    Color? stateColor;
    bool validated = _fieldValidator!(_controller.text) == null;
    if (validated) {
      stateColor = AppColors.accentSuccess[70];
      _setState(() {});

      return stateColor;
    }
    if (!validated && _controller.text.isNotEmpty) {
      stateColor = AppColors.accentError[70];
      _setState(() {});

      return stateColor;
    }

    if (_hasFocus) {
      stateColor = AppColors.accentOrange;
      _setState(() {});
      return stateColor;
    }
    return stateColor;
  }
}
