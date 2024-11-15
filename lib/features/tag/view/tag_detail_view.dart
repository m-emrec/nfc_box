library tag_detail_view;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/config/routes/router.dart';

import '../../../../core/utils/widgets/item card/item_card.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/models/tag.dart';
import '../../../core/utils/widgets/custom%20bottom%20sheet/custom_bottom_sheet.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../providers/provider.dart';
import 'widgets/bottom sheet/add_item_bottom_sheet.dart';

part 'widgets/item_list.dart';
part 'widgets/_no_item_list.dart';
part 'widgets/app bar/_tag_detail_app_bar.dart';
part 'widgets/app bar/app_bar_utils.dart';
part 'widgets/app bar/edit_state_app_bar.dart';
part 'widgets/app bar/edit_state_app_bar_utils.dart';
part 'widgets/floating_action_buttons.dart';

class TagDetailView extends ConsumerWidget {
  const TagDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Tag tag = ref.watch(TagDetailProviders.tagDetailViewModelProvider);
    return Scaffold(
      floatingActionButton: _FloatingActionButtons(
        ref: ref,
      ),
      appBar: _TagDetailAppBar(tag: tag),
      body: Padding(
        padding: AppPaddings.authHPadding,
        child: tag.items == null || tag.items!.isEmpty
            ? const _NoItemList()
            : _ItemList(items: tag.items!),
      ),
    );
  }
}
