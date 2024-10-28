part of buttons_import;

class FAB extends StatefulWidget {
  final Widget child;

  final Future<void> Function()? onPressed;
  const FAB({super.key, required this.child, this.onPressed});

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  bool? isLoading;

  setLoadingState(val) {
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
    );
  }
}

//