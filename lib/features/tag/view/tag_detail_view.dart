library tag_detail_view;

import 'package:flutter/material.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/constants/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/models/item.dart';
import '../../../core/utils/models/tag.dart';
import '../../items/view/widgets/item card/item_card.dart';

part 'widgets/_tag_detail_app_bar.dart';
part 'widgets/_no_item_list.dart';
part 'widgets/_item_list.dart';

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
