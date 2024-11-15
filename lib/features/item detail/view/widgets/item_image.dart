part of '../item_detail_view.dart';

class _ItemImage extends StatelessWidget {
  const _ItemImage({
    required this.hasImage,
    required this.item,
  });

  final bool hasImage;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: hasImage,
      child: ClipRRect(
        borderRadius: AppBorderRadius.mediumBorderRadius,
        child: GestureDetector(
          onTap: () =>
              _ItemImageUtils._showFullSizedImage(context, item.imageUrl!),
          child: AspectRatio(
            aspectRatio: 1,
            child: CachedNetworkImage(
              imageUrl: item.imageUrl!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _ItemImageUtils {
  static void _showFullSizedImage(
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
