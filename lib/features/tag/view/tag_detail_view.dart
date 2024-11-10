library tag_detail_view;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/widgets/item card/item_card.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/models/tag.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../providers/provider.dart';

part 'widgets/_item_list.dart';
part 'widgets/_no_item_list.dart';
part 'widgets/app bar/_tag_detail_app_bar.dart';
part 'widgets/app bar/app_bar_utils.dart';
part 'widgets/app bar/edit_state_app_bar.dart';

class TagDetailView extends StatelessWidget {
  final Tag tag;
  const TagDetailView({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
