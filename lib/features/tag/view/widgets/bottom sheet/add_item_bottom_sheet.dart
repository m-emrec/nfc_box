import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';
import 'package:nfc_box/core/extensions/context_extension.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import 'package:nfc_box/core/utils/widgets/custom%20bottom%20sheet/custom_bottom_sheet.dart';
import 'package:nfc_box/core/utils/widgets/item%20card/item_card.dart';
import 'package:nfc_box/features/tag/providers/provider.dart';
import 'package:nfc_box/logger.dart';

import '../../../../../core/utils/models/item.dart';

part 'loaded_list_of_items.dart';

class AddItemBottomSheet extends ConsumerWidget {
  const AddItemBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DataState> itemList =
        ref.watch(TagDetailProviders.itemListProvider);

    return CustomBottomSheet(
      content: itemList.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPaddings.sPadding,
            ),
            child: _LoadedListOfItems(items: data.data),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stackTrace) {
          logger.e(error);
          return Center(
            child: Text(error.toString()),
          );
        },
      ),
    );
  }
}
