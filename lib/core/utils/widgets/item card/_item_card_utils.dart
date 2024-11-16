part of 'item_card.dart';

final class _ItemCardUtils {
  _ItemCardUtils({
    required this.context,
    required this.item,
    required this.ref,
    this.removeAction,
  }) {
    /// initialize the variables
    imageExist = item.imageUrl != null && item.imageUrl!.isNotEmpty;
    width = context.screenSize.width;
    height = context.screenSize.height * .1;
  }
  final BuildContext context;
  final WidgetRef ref;
  final Item item;
  final VoidCallback? removeAction;

  /// controls the duration of the text animation
  final Duration textAnimationDuration = const Duration(milliseconds: 500);

  /// controls the speed of the text flow animation
  final int textFlowSpeed = 40;

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
    return Visibility(
      visible: removeAction != null,
      child: GestureDetector(
        onTap: () => removeAction!(),
        //  ref.read(provider.itemListProvider.notifier).removeItem(item),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.accentError[50],
          child: Image.asset(
            AppAssets.removeBoxPath,
            height: 24,
            width: 24,
            color: Colors.white,
          ),
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
      // textStyle: context.textTheme.bodyMedium?.copyWith(
      //   color: AppColors.accentError[100],
      // ),
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
