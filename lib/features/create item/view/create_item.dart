import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nfc_box/logger.dart';

import '../../../core/constants/app_paddings.dart';
import '../../../core/utils/widgets/buttons/responsive_button.dart';
import '../../../core/utils/widgets/custom_bottom_sheet.dart';
import '../../../core/utils/widgets/custom_text_field.dart';
import '../providers/providers.dart';
import 'widgets/field_list.dart';
import 'widgets/fields/choose field type/choose_field_type_sheet.dart';
import 'widgets/image_container.dart';

class CreateItem extends ConsumerWidget {
  const CreateItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) =>
          ref.read(fieldListProvider).clear(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(_CreateItemUtils.addItem),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final a = ref.watch(fieldListProvider);
            logger.i(a[0].fieldController.text);
          },
          child: const Icon(Icons.check),
        ),
        body: Padding(
          padding: AppPaddings.authHPadding,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// Image container to choose a image
                  const ImageContainer(),
                  Gap(AppPaddings.lPadding),

                  /// This is the text field for the item name
                  CustomTextField(
                    label: _CreateItemUtils.itemName,
                  ),
                  Gap(AppPaddings.lPadding),

                  ///list of fields
                  const FieldList(),

                  ///button to add a field
                  ResponsiveElevatedButton(
                    onPressed: () async =>
                        _CreateItemUtils.showBottomSheet(context),
                    isPrimary: false,
                    child: const Text(_CreateItemUtils.addField),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// This class contains the properties for the CreateItem widget
final class _CreateItemUtils {
  static const String addField = 'Add Field';
  static const String addItem = 'Add Item';
  static const String itemName = 'Item Name';
  static void showBottomSheet(
    context,
  ) async {
    await CustomBottomSheet.show(
      context,
      widget: const ChooseFieldTypeSheet(),
    );
  }
}
