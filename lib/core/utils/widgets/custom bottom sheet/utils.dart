part of 'custom_bottom_sheet.dart';

final class _CustomBottomSheetUtils {
  final BuildContext context;
  final double heightFactor;
  late AnimationController _animationController;

  _CustomBottomSheetUtils({
    required this.context,
    required this.heightFactor,
  });

  void initState({
    required TickerProvider vsync,
    required Function setState,
  }) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Durations.medium2,
    );
    _animationController.forward(from: 0.1);
    _animationController.addListener(() => setState());
  }

  void dispose() {
    _animationController.removeListener(() {});
    _animationController.dispose();
  }

  final Color? shadowColor = AppColors.neutralBackgroundLight[100];
  final Color? handleColor = AppColors.neutralBackgroundLight[100];
  final Color? backgroundColor = AppColors.neutralBackgroundLight[50];

  ///I get keyboard size , this way I can change the maxHeight of the BottomSheet
  double get _keyboardSize => context.mediaQuery.viewInsets.bottom;
  bool get _isKeyboardVisible => _keyboardSize > 0;
  double get _maxHeight =>
      context.screenSize.height * heightFactor * _animationController.value +
      _keyboardSize;

  double get _minHeight =>
      context.screenSize.height * heightFactor * _animationController.value +
      _keyboardSize;

  BoxConstraints constraints(BuildContext context) {
    return BoxConstraints(
      minHeight: _minHeight,
      maxHeight: _maxHeight,
      minWidth: context.screenSize.width,
      maxWidth: context.screenSize.width,
    );
  }
}
