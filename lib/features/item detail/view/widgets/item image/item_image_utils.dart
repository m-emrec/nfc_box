part of '../../item_detail_view.dart';

mixin _ItemImageUtils on State<_ItemImage> {
  late AnimationController controller;
  final String tapToSeeFullImage = tr(LocaleKeys.itemDetail_tapToSeeFullImage);

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  void initializeAnimationController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
      lowerBound: 0,
      upperBound: 0.8,
    );

    controller.reverse(from: controller.upperBound);
    controller.addListener(
      () {
        setState(() {});
      },
    );
  }

  void showFullSizedImage(
    BuildContext context,
    String imageUrl,
  ) async {
    builder(BuildContext context) => InteractiveViewer(
          maxScale: 4,
          minScale: 1,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseButton(
                  onPressed: () => context.pop(),
                  color: AppColors.accentError[90],
                ),
              ],
            ),
            content: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
    await showDialog(context: context, builder: builder);
  }
}
