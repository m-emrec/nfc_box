import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/routes/router.dart';
import '../../../core/utils/models/tag.dart';
import '../view/tag_loading_view.dart';

mixin TagLoadingViewMixin on State<TagLoadingView> {
  final Duration _delay = const Duration(seconds: 2);
  final String noNameText = "No Name";
  final String heroTag = "tag";

  @override
  void initState() {
    _navigateToTagView(widget.tag);
    super.initState();
  }

  void _navigateToTagView(Tag tag) async {
    if (context.mounted) {
      await Future.delayed(
          _delay,
          // ignore: use_build_context_synchronously
          () => context.goNamed(Routes.tagDetail.name, extra: tag));
    }
  }
}
