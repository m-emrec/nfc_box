part of buttons_import;

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

  setLoadingState(val) {
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
                  setState: setLoadingState,
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
