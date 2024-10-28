import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/logger.dart';

import '../../../constants/colors.dart';

class ResponsiveElevatedButton extends StatefulWidget {
  const ResponsiveElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isPrimary = true,
  });
  final bool isPrimary;
  final Widget child;
  final Future<void> Function()? onPressed;

  @override
  State<ResponsiveElevatedButton> createState() =>
      _ResponsiveElevatedButtonState();
}

class _ResponsiveElevatedButtonState extends State<ResponsiveElevatedButton> {
  bool? isLoading;

  setLoadingState(val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: widget.isPrimary ? _primaryShadows : _secondaryShadows,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.isPrimary
                    ? AppColors.primaryBlue
                    : AppColors.secondaryTeal,
              ),
              onPressed: isLoading ?? false
                  ? null
                  : () => _ManageLoadingState.setLoadingState(
                        context: context,
                        setState: setLoadingState,
                        func: widget.onPressed,
                      ),
              child: isLoading ?? false
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    )
                  : widget.child,
            ),
          ),
        ),
      ],
    );
  }

  static final List<BoxShadow> _primaryShadows = [
    const BoxShadow(
      color: Color(0x630066FF),
      blurRadius: 1,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x560066FF),
      blurRadius: 2,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x330066FF),
      blurRadius: 3,
      offset: Offset(0, 5),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x0F0066FF),
      blurRadius: 4,
      offset: Offset(0, 10),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x020066FF),
      blurRadius: 4,
      offset: Offset(0, 15),
      spreadRadius: 0,
    )
  ];
  static final List<BoxShadow> _secondaryShadows = [
    const BoxShadow(
      color: Color(0x6302B3A6),
      blurRadius: 1,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x5602B3A6),
      blurRadius: 2,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x3302B3A6),
      blurRadius: 3,
      offset: Offset(0, 5),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x0F02B3A6),
      blurRadius: 4,
      offset: Offset(0, 10),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x0202B3A6),
      blurRadius: 4,
      offset: Offset(0, 15),
      spreadRadius: 0,
    )
  ];
}

/// Wrap this widget with row
class ResponsiveOutlinedButton extends StatefulWidget {
  final Widget child;

  final Future<void> Function()? onPressed;

  const ResponsiveOutlinedButton({
    super.key,
    this.onPressed,
    this.style,
    required this.child,
  });
  final ButtonStyle? style;

  @override
  State<ResponsiveOutlinedButton> createState() =>
      _ResponsiveOutlinedButtonState();
}

class _ResponsiveOutlinedButtonState extends State<ResponsiveOutlinedButton> {
  bool? isLoading;

  set(val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(context.findAncestorWidgetOfExactType<Row>() != null,
        "You have to wrap this this widget with Row !");
    return Expanded(
      child: OutlinedButton(
        style: widget.style,
        onPressed: isLoading ?? false
            ? null
            : () => _ManageLoadingState.setLoadingState(
                  context: context,
                  setState: set,
                  func: widget.onPressed,
                ),
        child: isLoading ?? false
            ? const SizedBox(
                height: 32,
                width: 32,
                child: CircularProgressIndicator(),
              )
            : widget.child,
      ),
    );
  }
}

/// Use [setLoadingState] function to show a [CircularProgressIndicator] on the button.
///
class _ManageLoadingState {
  /// I use this Function to show a [CircularProgressIndicator] on the Button
  /// and I block user interaction with [showDialog].
  ///
  /// This way user can't interact with something before the given Function completes
  ///
  ///### Parameters
  /// It takes [BuildContext] to use [showDialog]
  ///
  /// A [Function] func to execute
  ///
  /// and another [Function]setState to set the state of the button
  static void setLoadingState({
    required BuildContext context,
    Function? func,
    required Function setState,
  }) async {
    if (func != null) {
      setState(true);

      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        builder: (context) {
          return const PopScope(
            canPop: false,
            child: SizedBox(),
          );
        },
      );
      await func();
      setState(false);
      if (context.mounted) {
        context.pop();
      }
    }
  }
}

class FAB extends StatefulWidget {
  final Widget child;

  final Future<void> Function()? onPressed;
  const FAB({super.key, required this.child, this.onPressed});

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  bool? isLoading;

  set(val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: isLoading ?? false
          ? null
          : () => _ManageLoadingState.setLoadingState(
                context: context,
                setState: set,
                func: widget.onPressed,
              ),
      child: isLoading ?? false
          ? const SizedBox(
              height: 32,
              width: 32,
              child: CircularProgressIndicator(),
            )
          : widget.child,
    );
  }
}

//