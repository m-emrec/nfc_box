import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/core/constants/border_radiuses.dart';
import 'package:nfc_box/core/constants/colors.dart';
import 'package:nfc_box/core/constants/enums/item_field_names.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/core/utils/models/field_model.dart';
import 'package:nfc_box/core/utils/models/item.dart';
import 'package:nfc_box/logger.dart';

import '../../../config/routes/router.dart';

part 'widgets/fields/item_color_field.dart';
part 'widgets/fields/item_date_field.dart';
part 'widgets/fields/item_text_field.dart';
part 'widgets/item_image.dart';
part 'widgets/field_list.dart';
part 'widgets/created_date_text.dart';
part 'widgets/item_name.dart';

class ItemDetailView extends StatelessWidget {
  final Item item;
  const ItemDetailView({super.key, required this.item});

  bool get hasImage => item.imageUrl != null && item.imageUrl!.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              Item? _item = await context
                  .pushNamed<Item>(Routes.editItem.name, extra: item)
                  .then(
                    (value) => value as Item?,
                  );
              WidgetsBinding.instance.addPostFrameCallback((_) {
                logger.w('Page returned $_item');
              });
              logger.d('ItemDetailView: _item: $_item');
            },
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
                  _ItemImage(hasImage: hasImage, item: item),
                  Gap(AppPaddings.xsPadding),
                  _ItemName(item: item),
                  Gap(AppPaddings.xxsPadding),
                  // date
                  _CreatedDateText(item: item),

                  Gap(AppPaddings.mPadding),

                  item.fields != null
                      ? _FieldList(item: item)
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
