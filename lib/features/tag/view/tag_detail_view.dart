import 'package:flutter/material.dart';
import '../../../core/utils/models/tag.dart';

class TagDetailView extends StatelessWidget {
  final Tag tag;
  const TagDetailView({
    super.key,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(tag.toString()),
      ),
    );
  }
}
