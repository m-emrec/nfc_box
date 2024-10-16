import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ResponsiveElevatedButton extends StatelessWidget {
  const ResponsiveElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isPrimary = true,
  });
  final bool isPrimary;
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    const List<BoxShadow> _primaryShadows = [
      BoxShadow(
        color: Color(0x630066FF),
        blurRadius: 1,
        offset: Offset(0, 1),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x560066FF),
        blurRadius: 2,
        offset: Offset(0, 2),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x330066FF),
        blurRadius: 3,
        offset: Offset(0, 5),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x0F0066FF),
        blurRadius: 4,
        offset: Offset(0, 10),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x020066FF),
        blurRadius: 4,
        offset: Offset(0, 15),
        spreadRadius: 0,
      )
    ];
    const List<BoxShadow> _secondaryShadows = [
      BoxShadow(
        color: Color(0x6302B3A6),
        blurRadius: 1,
        offset: Offset(0, 1),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x5602B3A6),
        blurRadius: 2,
        offset: Offset(0, 2),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x3302B3A6),
        blurRadius: 3,
        offset: Offset(0, 5),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x0F02B3A6),
        blurRadius: 4,
        offset: Offset(0, 10),
        spreadRadius: 0,
      ),
      BoxShadow(
        color: Color(0x0202B3A6),
        blurRadius: 4,
        offset: Offset(0, 15),
        spreadRadius: 0,
      )
    ];
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: isPrimary ? _primaryShadows : _secondaryShadows,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isPrimary ? AppColors.primaryBlue : AppColors.secondaryTeal,
              ),
              onPressed: onPressed,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

/// Wrap this widget with row
class ResponsiveOutlinedButton extends StatelessWidget {
  final Widget child;

  final void Function()? onPressed;

  const ResponsiveOutlinedButton({
    super.key,
    this.onPressed,
    this.style,
    required this.child,
  });
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    assert(context.findAncestorWidgetOfExactType<Row>() != null,
        "You have to wrap this this widget with Row !");
    return Expanded(
      child: OutlinedButton(
        style: style,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
