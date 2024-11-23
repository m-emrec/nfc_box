import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
import 'package:nfc_box/config/routes/router.dart';
import 'package:nfc_box/config/theme/theme_extensions/item_card_theme.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_paddings.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/utils/models/item.dart';

part '_item_card_utils.dart';

class ItemCard extends ConsumerWidget {
  const ItemCard({
    super.key,
    required this.item,
    this.removeAction,
  });

  final VoidCallback? removeAction;
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ItemCardUtils itemCardUtils = _ItemCardUtils(
        context: context, item: item, ref: ref, removeAction: removeAction);
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.itemDetail.name,
        extra: item,
      ),
      child: Card(
        color: context.theme
            .extension<ItemCardTheme>()
            ?.backgroundColor, // AppColors.neutralBackgroundLight[50],
        elevation: context.theme.extension<ItemCardTheme>()?.elevation,
        shadowColor: context.theme.extension<ItemCardTheme>()?.shadowColor,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: itemCardUtils.height,
          width: itemCardUtils.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Leading
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    itemCardUtils.image(
                        itemCardUtils.imageExist, itemCardUtils.height),
                    MaxGap(AppPaddings.xxsPadding),
                    itemCardUtils.title(context),
                  ],
                ),
              ),
              // Trailing
              Padding(
                padding: EdgeInsets.only(
                  right: AppPaddings.xsPadding,
                  bottom: AppPaddings.xsPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    itemCardUtils.removeButton(),
                    itemCardUtils.date(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
