import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/core/constants/border_radiuses.dart';
import 'package:nfc_box/core/constants/colors.dart';
import 'package:nfc_box/core/constants/enums/item_field_names.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/core/utils/models/field_model.dart';
import 'package:nfc_box/core/utils/models/item.dart';

import '../../../config/routes/router.dart';

part 'widgets/fields/item_color_field.dart';
part 'widgets/fields/item_date_field.dart';
part 'widgets/fields/item_text_field.dart';
part 'widgets/item image/item_image.dart';
part 'widgets/field_list.dart';
part 'widgets/created_date_text.dart';
part 'widgets/item_name.dart';
part 'widgets/item image/tap_to_see_full_image_text.dart';
part 'widgets/item image/item_image_utils.dart';

class ItemDetailView extends StatefulWidget {
  final Item item;
  const ItemDetailView({super.key, required this.item});

  @override
  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  bool get hasImage =>
      widget.item.imageUrl != null && widget.item.imageUrl!.isNotEmpty;
  final String noFields = tr(LocaleKeys.itemDetail_noFieldsText);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async => await context
                .pushNamed<Item>(Routes.editItem.name, extra: widget.item),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPaddings.sPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ItemImage(hasImage: hasImage, item: widget.item),
                  Gap(AppPaddings.xsPadding),
                  _ItemName(item: widget.item),
                  Gap(AppPaddings.xxsPadding),
                  // date
                  _CreatedDateText(item: widget.item),

                  Gap(AppPaddings.mPadding),

                  widget.item.fields != null
                      ? _FieldList(item: widget.item)
                      : Center(
                          child: Text(
                            noFields,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
