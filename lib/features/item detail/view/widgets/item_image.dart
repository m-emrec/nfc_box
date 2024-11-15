part of '../item_detail_view.dart';

class _ItemImage extends StatefulWidget {
  const _ItemImage({
    required this.hasImage,
    required this.item,
  });

  final bool hasImage;
  final Item item;

  @override
  State<_ItemImage> createState() => _ItemImageState();
}

class _ItemImageState extends State<_ItemImage>
    with SingleTickerProviderStateMixin, _ItemImageUtils {
  @override
  void initState() {
    initializeAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.hasImage,
      child: ClipRRect(
        borderRadius: AppBorderRadius.mediumBorderRadius,
        child: GestureDetector(
          onTap: () => showFullSizedImage(context, widget.item.imageUrl!),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: widget.item.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              AnimatedOpacity(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

mixin _ItemImageUtils on State<_ItemImage> {
  late AnimationController controller;
  final String tapToSeeFullImage = 'Tap to see full image';

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
