part of '../../item_detail_view.dart';

class _TapToSeeFullImageText extends StatelessWidget {
  const _TapToSeeFullImageText({
    super.key,
    required this.controller,
    required this.tapToSeeFullImage,
  });

  final AnimationController controller;
  final String tapToSeeFullImage;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: controller.duration!,
      opacity: controller.value,
      child: Center(
        child: ColoredBox(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(AppPaddings.xsPadding),
            child: Text(
              tapToSeeFullImage,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.neutralGray100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
