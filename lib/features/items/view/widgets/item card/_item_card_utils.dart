part of 'item_card.dart';

final class _ItemCardUtils {
  _ItemCardUtils({
    required this.context,
    required this.item,
    required this.ref,
  }) {
    /// initialize the variables
    imageExist = item.imageUrl != null && item.imageUrl!.isNotEmpty;
    width = context.screenSize.width;
    height = context.screenSize.height * .1;
  }

  /// controls the duration of the text animation
  final Duration textAnimationDuration = const Duration(milliseconds: 500);

  /// controls the speed of the text flow animation
  final int textFlowSpeed = 40;
  final Item item;

  final BuildContext context;
  final WidgetRef ref;
  late bool imageExist;
  late double width;
  late double height;

  /// Date text
  Text date(BuildContext context) {
    return Text(
      DateFormat.yMd().format(item.createdDate ?? DateTime.now()),
      style: context.textTheme.bodySmall?.copyWith(
        color: AppColors.neutralGray500[50],
      ),
    );
  }

  /// Remove button
  Widget removeButton() {
    return GestureDetector(
      onTap: () =>
          ref.read(ItemListProvider.itemListProvider.notifier).removeItem(item),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.accentError[50],
        child: Image.asset(
          AppAssets.removeBoxPath,
          color: Colors.white,
        ),
      ),
    );
  }

  /// Title text
  Flexible title(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: TickerText(
        speed: textFlowSpeed,
        endPauseDuration: textAnimationDuration,
        startPauseDuration: textAnimationDuration,
        child: Text(
          item.itemName ?? "",
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }

  Visibility image(bool imageExist, double height) {
    /// if there is an image url show this widget otherwise don't show it.
    return Visibility(
      visible: imageExist,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: height,
        height: height,
        imageUrl: item.imageUrl ?? " ",
        errorWidget: errorImage,
        progressIndicatorBuilder: (context, url, progress) =>
            imageProgressIndicator(),
      ),
    );
  }

  Center imageProgressIndicator() {
    return const Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.image,
          ),
        ],
      ),
    );
  }

  /// Image error widget
  Widget errorImage(context, url, error) {
    String imageNotFound = 'Image not found';
    return Tooltip(
      message: imageNotFound,
      triggerMode: TooltipTriggerMode.tap,
      decoration: BoxDecoration(
        color: AppColors.accentError[20],
      ),
      textStyle: context.textTheme.bodyMedium?.copyWith(
        color: AppColors.accentError[100],
      ),
      child: ColoredBox(
        color: AppColors.accentError,
        child: Icon(
          Icons.error_outline,
          color: AppColors.accentError[70],
        ),
      ),
    );
  }
}
