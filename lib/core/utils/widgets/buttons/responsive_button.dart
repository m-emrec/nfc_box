part of buttons_import;

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
