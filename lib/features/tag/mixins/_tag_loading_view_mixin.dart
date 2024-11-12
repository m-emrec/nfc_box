import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nfc_box/features/tag/providers/provider.dart';

import '../../../config/routes/router.dart';
import '../view/tag_loading_view.dart';

mixin TagLoadingViewMixin on ConsumerState<TagLoadingView> {
  final Duration _delay = const Duration(seconds: 2);
  final String noNameText = "No Name";
  final String heroTag = "tag";

  @override
  void initState() {
    TagDetailProviders(widget.tag);
    _navigateToTagView();
    super.initState();
  }

  void _navigateToTagView() async {
    if (context.mounted) {
      await Future.delayed(
          _delay,
          // ignore: use_build_context_synchronously
          () => context.goNamed(
                Routes.tagDetail.name,
              ));
    }
  }
}
