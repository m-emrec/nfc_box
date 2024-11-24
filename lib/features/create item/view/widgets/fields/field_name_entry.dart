import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../providers/providers.dart';

/// This will be used as the name of the elected field
class FieldNameEntry extends ConsumerWidget {
  final String? fieldID;
  const FieldNameEntry({
    super.key,
    this.fieldID,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var label = tr(LocaleKeys.createItem_fieldNameEntry_label);
    return CustomTextField(
      label: label,
      controller: controller,
      suffix: SizedBox(
        height: 24,
        width: 24,
        child: CloseButton(
          onPressed: () {
            ref.read(CreateItemProvider.fieldListProvider.notifier).update(
              (state) {
                state.removeWhere((element) => element.fieldID == fieldID);

                return [...state];
              },
            );
          },
        ),
      ),
    );
  }
}
