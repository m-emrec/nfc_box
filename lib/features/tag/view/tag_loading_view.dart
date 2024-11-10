import 'package:flutter/material.dart';

import '../../../core/utils/models/tag.dart';

class TagLoadingView extends StatefulWidget {
  final Tag tag;
  const TagLoadingView({super.key, required this.tag});

  @override
  State<TagLoadingView> createState() => _TagLoadingViewState();
}

class _TagLoadingViewState extends State<TagLoadingView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
