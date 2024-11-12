import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/models/tag.dart';
import '../mixins/_tag_loading_view_mixin.dart';

class TagLoadingView extends StatefulWidget {
  final Tag tag;
  const TagLoadingView({super.key, required this.tag});

  @override
  State<TagLoadingView> createState() => _TagLoadingViewState();
}

class _TagLoadingViewState extends State<TagLoadingView>
    with TagLoadingViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: heroTag,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: AppColors.neutralGray900[40],
                  ),
                  Text(
                    widget.tag.name ?? noNameText,
                    style: context.textTheme.titleLarge,
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
