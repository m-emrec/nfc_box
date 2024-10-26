import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../providers/providers.dart';

class FieldList extends ConsumerStatefulWidget {
  const FieldList({super.key});

  @override
  ConsumerState<FieldList> createState() => _FieldListState();
}

class _FieldListState extends ConsumerState<FieldList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        ...ref.watch(fieldListProvider).map(
              (field) => Padding(
                padding: EdgeInsets.only(bottom: AppPaddings.lPadding),
                child: Column(
                  children: [
                    field.fieldName,
                    Padding(
                      padding: EdgeInsets.only(left: AppPaddings.lPadding),
                      child: field.field,
                    ),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}
