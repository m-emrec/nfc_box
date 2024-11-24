part of '../../item_detail_view.dart';

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
              // Tap to see full image text
              _TapToSeeFullImageText(
                  controller: controller, tapToSeeFullImage: tapToSeeFullImage),
            ],
          ),
        ),
      ),
    );
  }
}
